package com.cqjtu.lexian.controller.manager;

import com.cqjtu.lexian.aop.AdminControllerLog;
import com.cqjtu.lexian.domain.Catalog;
import com.cqjtu.lexian.domain.Category;
import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.domain.GoodsAttr;
import com.cqjtu.lexian.service.CatalogService;
import com.cqjtu.lexian.service.CategoryService;
import com.cqjtu.lexian.service.GoodsAttrService;
import com.cqjtu.lexian.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.*;

/**
 * ProductController 分类控制器
 *
 * @author suwen
 */
@EnableTransactionManagement
@Controller
@RequestMapping("/admin/product")
public class ProductController {

  @Autowired CategoryService categoryService;
  @Autowired CatalogService catalogService;
  @Autowired GoodsService goodsService;
  @Autowired GoodsAttrService goodsAttrService;

  /** 产品列表 */
  @RequestMapping("/list")
  public String list(ModelMap model) {
    model.put("catalogList", getCategory());
    model.put("goods", goodsService.getAllGoods());
    return "manager/product/Products_List";
  }

  /** 分类管理 */
  @RequestMapping("/category")
  public String category(ModelMap model) {
    model.put("catalogList", getCategory());
    return "manager/product/Category_Manage";
  }

  /** 添加商品 */
  @RequestMapping("/product_add")
  public String productAdd(Integer id, ModelMap model) {
    if (id != null) {
      model.put("goods", goodsService.getGoodsById(id));
    } else {
      model.put("goods", new Goods());
    }
    model.put("catalogList", getCategory());
    return "manager/product/product-add";
  }

  /** 获取商品 */
  @RequestMapping(value = "/get_goods", method = RequestMethod.POST)
  @ResponseBody
  public List<Goods> getGoods(Integer categoryId) {
    if (categoryId == null || 0 == categoryId) {
      return goodsService.getAllGoods();
    }
    return goodsService.getGoodsByCategoryId(categoryId);
  }

  /** 获取商品大类 */
  private HashMap<Catalog, List<Category>> getCategory() {
    HashMap<Catalog, List<Category>> result = new HashMap<>();
    Iterable<Catalog> catalogs = catalogService.getAllCatalogs();
    for (Catalog catalog : catalogs) {
      result.put(catalog, categoryService.getAllByCatalog(catalog));
    }
    return result;
  }

  /** 添加商品或修改 */
  @RequestMapping(value = "/new_product_add", method = RequestMethod.POST)
  @ResponseBody
  @AdminControllerLog(description = "添加商品或修改")
  public Map<String, Object> newProduct(
      Goods goods,
      Integer categoryid,
      @RequestParam MultipartFile picture,
      @RequestParam MultipartFile[] bigpic,
      @RequestParam MultipartFile[] adpic,
      String[] attrname,
      String[] attrvalue,
      String[] attrid,
      HttpServletRequest request) {
    Map<String, Object> result = new HashMap<>();
    boolean status = false;
    String msg = "添加失败";
    Goods good = newProduct(goods, categoryid);
    if (picture.getSize() <= 0 && good.getGoodsId() == 0) {
      msg = "缺少图片";
    } else if (picture.getSize() >= 0) {
      String pictureName = System.currentTimeMillis() + ".jpg";
      if (picture.getSize() > 0) {
        try {
          File file =
              new File(request.getServletContext().getRealPath("/img/goodsImg"), pictureName);
          picture.transferTo(file);
          good.setImg("../../../img/goodsImg/" + pictureName);
          status = true;
        } catch (Exception e) {
          status = false;
          e.printStackTrace();
        }
      } else {
        status = true;
      }
      if (status) {
        Goods goods1 = goodsService.addGood(good);
        if (attrname != null) {
          List<GoodsAttr> attrs = new ArrayList<>();
          if (attrid != null) {
            for (int i = 0; i < attrid.length; i++) {
              if ("".equals(attrname[i]) || "".equals(attrvalue[i])) {
                goodsAttrService.deleteAttrByAttrId(Integer.parseInt(attrid[i]));
              } else {
                GoodsAttr goodsAttr = goodsAttrService.findById(Integer.parseInt(attrid[i]));
                goodsAttr.setName(attrname[i]);
                goodsAttr.setValue(attrvalue[i]);
                goodsAttr.setGoods(goods1);
                attrs.add(goodsAttr);
              }
            }
          }
          for (int i = attrid == null ? 0 : attrid.length,
                  l = Math.min(attrname.length, attrvalue.length);
              i < l;
              i++) {
            if (!"".equals(attrname[i]) || !"".equals(attrvalue[i])) {
              GoodsAttr attr = new GoodsAttr();
              attr.setName(attrname[i]);
              attr.setValue(attrvalue[i]);
              attr.setGoods(goods1);
              attrs.add(attr);
            }
          }
          goodsAttrService.addAttrs(attrs);
          goodsService.addBigPicture(goods1, bigpic, request);
          goodsService.addAdPicture(goods1, adpic, request);
        }
      }
    }
    result.put("status", status);
    result.put("msg", msg);
    return result;
  }

  /** 添加商品 */
  private Goods newProduct(Goods goods, int categoryId) {
    Goods good;
    if (goods.getGoodsId() == 0) {
      good = new Goods();
      good.setOnsaleTime(new Date());
      good.setStatus(0);
      good.setSaleCount(goods.getSaleCount());
    } else {
      good = goodsService.getGoodsById(goods.getGoodsId());
    }
    good.setWeight(goods.getWeight());
    Category category = new Category();
    category.setCategoryId(categoryId);
    good.setCategory(category);
    good.setUnitPrice(goods.getUnitPrice());
    good.setUnit(goods.getUnit());
    good.setName(goods.getName());
    good.setInventory(goods.getInventory());
    return good;
  }

  /** 修改商品状态 */
  @RequestMapping("/change_status")
  @ResponseBody
  @AdminControllerLog(description = "修改商品状态")
  public Map<String, Object> changeStatus(Integer id, Boolean status) {
    boolean success = false;
    Map<String, Object> result = new HashMap<>();
    if (id != null && status != null) {
      Goods goods = goodsService.getGoodsById(id);
      if (goods != null) {
        goods.setStatus(status ? 0 : 1);
        goodsService.updateGoods(goods);
        success = true;
      }
    }
    result.put("status", success);
    return result;
  }

  /** 删除商品 */
  @RequestMapping("/delete_good")
  @ResponseBody
  @Transactional
  @AdminControllerLog(description = "删除商品")
  public Map<String, Object> deleteGoods(Integer id) {
    Map<String, Object> result = new HashMap<>();
    if (id != null) {
      goodsAttrService.deleteGoodsAttr(id);
      goodsService.deleteGoods(id);
    }
    result.put("status", true);
    return result;
  }

  /** 添加分类 */
  @RequestMapping("/category_add")
  @ResponseBody
  @AdminControllerLog(description = "添加分类")
  public Map<String, Object> categoryAdd(Integer id, String name) {
    Map<String, Object> result = new HashMap<>();
    boolean status = false;
    if (id != null && name != null && !"".equals(name)) {
      Category category = new Category();
      category.setName(name);
      Catalog catalog = new Catalog();
      catalog.setCatalog_id(id);
      category.setCatalog(catalog);
      categoryService.addCategory(category);
      status = true;
    } else {
      result.put("msg", "信息不完整");
    }
    result.put("status", status);
    return result;
  }

  /** 删除分类 */
  @RequestMapping("/category_delete")
  @ResponseBody
  @AdminControllerLog(description = "删除分类")
  public Map<String, Object> categoryDelete(Integer id) {
    Map<String, Object> result = new HashMap<>();
    boolean status = false;
    if (id != null) {
      categoryService.deleteCategory(id);
      status = true;
    } else {
      result.put("msg", "信息不完整");
    }
    result.put("status", status);
    return result;
  }
}
