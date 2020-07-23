package com.lexian_life.service.impl;

import com.lexian_life.domain.*;
import com.lexian_life.exception.CustomerServiceException;
import com.lexian_life.persistence.*;
import com.lexian_life.service.GoodsService;
import com.lexian_life.util.PictureUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * GoodsServiceImpl 商品服务实现
 * 
 * @author suwen
 * @date 2020/7/22 下午4:59
 */
@Service
public class GoodsServiceImpl implements GoodsService {
  @Autowired private CatalogRepository catalogRepository;
  @Autowired private GoodsRepository goodsRepository;
  @Autowired private CategoryRepository categoryRepository;
  @Autowired private AttentionRepository attentionRepository;
  @Autowired private CommentRepository commentRepository;
  @Autowired private OrderRepository orderRepository;
  @Autowired private OrderItemRepository orderItemRepository;

  @Override
  public Goods findGoodsById(int id) {
    return goodsRepository.findOne(id);
  }

  @Override
  public List<Catalog> displayCatalogs() { // 获取status=1的Catalog列表
    List<Catalog> getCatalogs = catalogRepository.findAllByStatus(1);
    while (getCatalogs.size() > 10) {
      // 只保留前10个
      getCatalogs.remove(getCatalogs.size() - 1);
    }
    return getCatalogs;
  }

  @Override
  public List<Category> blurryCategorySearch(String categoryName) {
    return categoryRepository.findAllByNameLike("%" + categoryName + "%");
  }

  @Override
  public Page<Goods> blurryGoodsSearch(String goodName, int pageIndex, int sort) {
    PageRequest pr = createPageRequest(pageIndex - 1, 16, sort);
    return goodsRepository.findAllByNameLikeAndStatus("%" + goodName + "%", 0, pr);
  }

  @Override
  public Category getCategory(int category_id) {
    Category category = categoryRepository.findOne(category_id);
    List<Goods> goods = goodsRepository.findAllByStatus(0);
    category.setGoods(goods);
    return category;
  }

  @Override
  public Page<Goods> getGoods(int category_id, int pageIndex, int count, int sort) {

    PageRequest pageRequest = createPageRequest(pageIndex, count, sort);
    Category category = categoryRepository.findOne(category_id);
    return goodsRepository.findAllByCategoryAndStatus(category, 0, pageRequest);
  }

  @Override
  public Attention addAttention(Attention attention) {
    if (attentionRepository.findByCustomerAndGoods(attention.getCustomer(), attention.getGoods())
        == null) {
      return attentionRepository.save(attention);
    }
    return null;
  }

  private PageRequest createPageRequest(int pageIndex, int size, int sort) {
    switch (sort) {
      case 0:
        return new PageRequest(pageIndex, size);
      case 1:
        return new PageRequest(pageIndex, size, Sort.Direction.DESC, "saleCount");
      case 2:
        return new PageRequest(pageIndex, size, Sort.Direction.DESC, "unitPrice");
      case 3:
        return new PageRequest(pageIndex, size, Sort.Direction.ASC, "unitPrice");
      default:
        return null;
    }
  }

  @Override
  public List<Attention> getAttention(Customer customer) {
    return attentionRepository.findAllByCustomer(customer);
  }

  @Override
  public Page<Comment> getComment(int goodsId, int page) {
    return commentRepository.findAllByGoodsId(
        goodsId, new PageRequest(page - 1, 12, Sort.Direction.DESC, "time"));
  }

  @Override
  public int getCommentCountByScore(int goods_id, int score) {

    return commentRepository.countByGoodsIdAndScore(goods_id, score);
  }

  @Override
  public int getCurMonthSaleCount(int goods_id) {
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
    Calendar calendar = Calendar.getInstance();
    Date now = null;
    try {
      now =
          format.parse("" + calendar.get(Calendar.YEAR) + "-" + (calendar.get(Calendar.MONTH) + 1));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    //        int count = 0;
    //        List<Order> getOrders = orderRepository.findAllByCreateTimeAfter(now);
    //        for(int i=0;i<getOrders.size();i++){
    //            for(int j=0;j<getOrders.get(i).getOrderItems().size();j++){
    //                count += getOrders.get(i).getOrderItems().get(j).getNum();
    //            }
    //        }
    return orderItemRepository.countByOrder_PayTimeAfterAndGoods_GoodsId(now, goods_id);
  }

  @Override
  public List<Goods> getAllGoods() {
    return goodsRepository.findAll();
  }

  @Override
  public List<Goods> getGoodsByCategoryId(int id) {
    Category category = categoryRepository.findOne(id);
    category.setCategory_id(id);
    return goodsRepository.findAllByCategory(category);
  }

  @Override
  public Goods addGood(Goods goods) {
    return goodsRepository.save(goods);
  }

  @Override
  public void updateGoods(Goods goods) {
    goodsRepository.save(goods);
  }

  @Override
  public void deleteGoods(int id) {
    goodsRepository.delete(id);
  }

  @Override
  public Goods getGoodsById(int id) {
    return goodsRepository.findOne(id);
  }

  @Override
  public Page<Goods> getWellSaleGoods(int index, int size) {
    PageRequest request = new PageRequest(index - 1, size, Sort.Direction.DESC, "saleCount");
    return goodsRepository.findAll(request);
  }

  @Override
  public void addAdPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request) {
    String fileName;
    for (int i = 0, l = pics.length; i < l; ++i) {
      if (pics[i].getSize() > 0) {
        try {
          fileName = goods.getGoodsId() + "_d_" + (i + 1) + ".jpg";
          File file = new File(request.getServletContext().getRealPath("/img/goodsImg"), fileName);
          pics[i].transferTo(file);
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
  }

  @Override
  public void addBigPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request) {
    for (int i = 0, l = pics.length; i < l; ++i) {
      if (pics[i].getSize() > 0) {
        try {
          File file =
              new File(
                  request.getServletContext().getRealPath("/img/goodsImg"),
                  goods.getGoodsId() + "_b_" + (i + 1) + ".jpg");
          pics[i].transferTo(file);
          PictureUtil.getFixedIcon(file.getPath(), 350, 350, goods.getGoodsId() + "_m_" + (i + 1));
          PictureUtil.getFixedIcon(file.getPath(), 50, 50, goods.getGoodsId() + "_s_" + (i + 1));
        } catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
  }
}
