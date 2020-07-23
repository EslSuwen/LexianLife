package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.exception.CustomerServiceException;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/** Created by dengxiaobing on 2017/9/18. */
public interface GoodsService {
  /**
   * 通过Goods id获取Goods
   *
   * @param id
   * @return
   */
  Goods findGoodsById(int id);
  /**
   * 获取主页上显示的Catalog列表,只获取status=1的，并且最多只能返回10个
   *
   * @return
   */
  List<Catalog> displayCatalogs();

  /**
   * 商品各类的模糊查询
   *
   * @param categoryName
   * @return
   */
  List<Category> blurryCategorySearch(String categoryName);

  /**
   * 商品名的模糊查询
   *
   * @param goodName 商品名
   * @return
   */
  Page<Goods> blurryGoodsSearch(String goodName, int pageIndex, int sort);

  /**
   * 通過category_id獲取category對象
   *
   * @param category_id
   * @return
   */
  Category getCategory(int category_id);
  /**
   * 分页查询商品
   *
   * @param category_id
   * @param pageIndex
   * @param count
   * @param sort
   * @return
   */
  Page<Goods> getGoods(int category_id, int pageIndex, int count, int sort);

  /**
   * 添加关注
   *
   * @param attention
   */
  Attention addAttention(Attention attention);

  /**
   * 获取顾客的关注
   *
   * @param customer
   * @return
   * @throws CustomerServiceException
   */
  List<Attention> getAttention(Customer customer);

  /**
   * 分页查询商品的评论
   *
   * @param goodsId
   * @param page
   * @return
   */
  Page<Comment> getComment(int goodsId, int page);

  /**
   * 通过星数获取评论数
   *
   * @param score
   * @param goods_id
   * @return
   */
  int getCommentCountByScore(int goods_id, int score);

  int getCurMonthSaleCount(int goods_id);

  List<Goods> getAllGoods();

  List<Goods> getGoodsByCategoryId(int id);

  Goods addGood(Goods goods);

  void updateGoods(Goods goods);

  void deleteGoods(int id);

  Goods getGoodsById(int id);

  /**
   * 分页查询销量最好的商品
   *
   * @param index 从1开始
   * @param size
   * @return
   */
  Page<Goods> getWellSaleGoods(int index, int size);

  void addBigPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request);

  void addAdPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request);
}
