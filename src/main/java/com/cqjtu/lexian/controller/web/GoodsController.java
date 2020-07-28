package com.cqjtu.lexian.controller.web;

import com.cqjtu.lexian.domain.*;
import com.cqjtu.lexian.service.CustomerService;
import com.cqjtu.lexian.service.GoodsService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * GoodsController 商品控制器
 *
 * @author suwen
 */
@Controller
public class GoodsController {
  @Autowired private GoodsService goodsService;
  @Autowired private CustomerService customerService;

  /**
   * 商品查看
   *
   * @param name 商品名
   * @param pageIndex 分页号
   * @param sort 排序类型
   * @return 商品查看页面
   */
  @RequestMapping(
      value = "/findGoods",
      method = {RequestMethod.POST, RequestMethod.GET})
  public String findGoods(
      String name,
      @RequestParam(required = false, defaultValue = "1") Integer pageIndex,
      @RequestParam(required = false, defaultValue = "0") Integer sort,
      HttpServletRequest request) {

    Page<Goods> goodsPage = goodsService.blurryGoodsSearch(name, pageIndex, sort);
    request.setAttribute("goodsPage", goodsPage);
    List<Category> mayFindList = goodsService.blurryCategorySearch(name);
    request.setAttribute("mayFindList", mayFindList);
    request.setAttribute("name", name);
    request.setAttribute("sort", sort);
    return "/foreground/product/ViewFindGoods";
  }

  /** 获取分类 */
  private Category getCategory(List<Catalog> catalogs, int categoryId) {
    Category category;
    for (Catalog catalog : catalogs) {
      for (int j = 0; j < catalog.getCategories().size(); j++) {
        if (catalog.getCategories().get(j).getCategoryId() == categoryId) {
          category = catalog.getCategories().get(j);
          return category;
        }
      }
    }
    return null;
  }

  /**
   * @param categoryId 分类编号
   * @param pageIndex 页(从1开始)
   * @param sort 排序方式(0综合,1销量优先,2价格优先
   * @return 产品查看页面
   */
  @RequestMapping(
      value = "/viewCategory",
      method = {RequestMethod.GET})
  public String viewCategory(
      int categoryId,
      int pageIndex,
      @RequestParam(required = false, defaultValue = "0") Integer sort,
      HttpServletRequest request) {
    List<Catalog> catalogs = (List<Catalog>) request.getSession().getAttribute("catalogs");
    Category category = getCategory(catalogs, categoryId);

    if (sort == 2 && request.getSession().getAttribute("sort").equals(2)) {
      sort = 3;
    }
    request.getSession().setAttribute("sort", sort);
    Page<Goods> goodsPage =
        goodsService.getGoods(category.getCategoryId(), pageIndex - 1, 16, sort);
    request.setAttribute("viewCategory", category);
    request.setAttribute("page", goodsPage);
    return "/foreground/product/ViewProduct";
  }

  /** TODO 根据价格查看分类 */
  public String viewCategoryByPrice(
      int categoryId,
      int pageIndex,
      @RequestParam(required = false) Integer sort,
      HttpServletRequest request) {
    return null;
  }

  /**
   * 添加关注
   *
   * @param goods_id 商品编号
   */
  @RequestMapping(value = "/addAttention")
  public void addAttention(int goods_id, HttpSession session, HttpServletResponse response) {
    try {
      JSONObject jsonObject = new JSONObject();
      String encoding = "utf-8";
      response.setContentType("text/plain;charset=" + encoding);
      response.setCharacterEncoding(encoding);
      PrintWriter pw = response.getWriter();
      Goods goods = goodsService.findGoodsById(goods_id);
      Customer customer = (Customer) session.getAttribute("customer");
      if (customer == null) {
        jsonObject.put("result", false);
        jsonObject.put("msg", "请先登录");
        pw.println(jsonObject.toString());
        pw.flush();
        pw.close();
        return;
      }
      Attention attention = new Attention();
      attention.setGoods(goods);
      attention.setCustomer(customer);
      Attention getAttention = goodsService.addAttention(attention);
      if (getAttention == null) {
        jsonObject.put("result", false);
        jsonObject.put("msg", "已关注该商品");
      } else {
        jsonObject.put("result", true);
        jsonObject.put("msg", "添加关注成功");
      }
      pw.println(jsonObject.toString());
      pw.flush();
      pw.close();
    } catch (IOException | JSONException e) {
      e.printStackTrace();
    }
  }

  /**
   * 查看商品详请
   *
   * @param goodsId 商品编号
   */
  @RequestMapping(
      value = "/viewGoods",
      method = {RequestMethod.GET})
  public String viewGoods(
      @RequestParam(name = "goods_id") Integer goodsId,
      HttpServletRequest request,
      HttpSession session) {
    Date now = new Date();
    int monthSaleCount = goodsService.getCurMonthSaleCount(goodsId);

    Goods goods = goodsService.findGoodsById(goodsId);
    if (goods.getGoodsAttrs().isEmpty()) {
      // 商品属性为空，载入默认属性
      goods.setGoodsAttrs(goodsService.findGoodsById(10010).getGoodsAttrs());
    }
    int goodCount =
        goodsService.getCommentCountByScore(goodsId, 5)
            + goodsService.getCommentCountByScore(goodsId, 4);
    int midCount =
        goodsService.getCommentCountByScore(goodsId, 3)
            + goodsService.getCommentCountByScore(goodsId, 2);
    int badCount =
        goodsService.getCommentCountByScore(goodsId, 1)
            + goodsService.getCommentCountByScore(goodsId, 0);
    // 如果顾客登录了就存到数据库中
    if (request.getSession().getAttribute("customer") != null) {
      System.out.println(goods);
      customerService.browseGoods(
          (Customer) request.getSession().getAttribute("customer"), goods, now);
    }
    // 没登录就存到 session 中
    else {
      List<BrowseRecord> browseRecords = (List<BrowseRecord>) session.getAttribute("browsedGoods");
      BrowseRecord browseRecord = new BrowseRecord();
      browseRecord.setTime(now);
      browseRecord.setGoods(goods);
      if (browseRecords == null) {
        browseRecords = new ArrayList<>();
      }
      browseRecords.add(browseRecord);
      session.setAttribute("browsedGoods", browseRecords);
    }
    request.setAttribute("monthSaleCount", monthSaleCount);
    request.setAttribute("goodCount", goodCount);
    request.setAttribute("midCount", midCount);
    request.setAttribute("badCount", badCount);
    request.setAttribute("viewGoods", goods);
    return "/foreground/product/ProductDetail";
  }

  /**
   * 查询商品评论
   *
   * @param goods_id 商品编号
   * @param pageIndex 分页数
   */
  @RequestMapping(
      value = "/queryComments",
      method = {RequestMethod.GET})
  public void queryComments(int goods_id, int pageIndex, HttpServletResponse response) {
    Page<Comment> page = goodsService.getComment(goods_id, pageIndex);
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    List<Comment> list = page.getContent();
    if (list.isEmpty()) {
      list = goodsService.getComment(1, pageIndex).getContent();
    }
    SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 hh:mm");
    try {
      PrintWriter pw = response.getWriter();
      JSONObject result = new JSONObject();
      JSONArray array = new JSONArray();
      for (Comment comment : list) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("name", customerService.getCustomer(comment.getCusId()).getNickname());
        jsonObject.put("time", format.format(comment.getTime()));
        jsonObject.put("content", comment.getContent());
        array.put(jsonObject);
      }
      result.put("pageIndex", pageIndex);
      result.put("pageCount", page.getTotalPages());
      result.put("comments", array);
      pw.println(result.toString());
      pw.flush();
      pw.close();
    } catch (IOException | JSONException e) {
      e.printStackTrace();
    }
  }

  /** 查询4个猜你喜欢 TODO serviceImpl 查询有bug */
  @RequestMapping(
      value = "/queryMayLike",
      method = {RequestMethod.GET})
  public void queryMayLike(
      HttpServletRequest request, HttpServletResponse response, HttpSession session) {

    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    Customer customer = (Customer) request.getSession().getAttribute("customer");
    JSONArray array = new JSONArray();
    try {
      PrintWriter pw = response.getWriter();
      List<BrowseRecord> browseRecords;
      List<Goods> goodsList = new ArrayList<>();
      // 读取顾客的浏览记录
      if (customer == null) {
        browseRecords = (List<BrowseRecord>) session.getAttribute("browsedGoods");
      } else {
        browseRecords = customerService.getBrowserRecords(1, customer);
      }
      if (browseRecords != null) {
        for (BrowseRecord each : browseRecords) {
          if (goodsList.size() < 4) {
            goodsList.add(each.getGoods());
          } else {
            break;
          }
        }
      }
      // 不够4个
      if (goodsList.size() < 4) {
        goodsList.addAll(goodsService.getWellSaleGoods(1, 4).getContent());
      }
      for (int i = 0; i < 4; i++) {
        JSONObject obj = new JSONObject();
        obj.put("goodsId", goodsList.get(i).getGoodsId());
        obj.put("img", goodsList.get(i).getImg());
        obj.put("name", goodsList.get(i).getName());
        obj.put("unitPrice", goodsList.get(i).getUnitPrice());
        obj.put("saleCount", goodsList.get(i).getSaleCount());
        array.put(obj);
      }
      pw.println(array.toString());
      pw.flush();
      pw.close();
    } catch (JSONException | IOException e) {
      e.printStackTrace();
    }
  }

  /** 查询销量最好的 */
  @RequestMapping(
      value = "/queryWellSale",
      method = {RequestMethod.GET})
  public void queryWellSale(HttpServletResponse response) {
    String encoding = "utf-8";
    response.setContentType("text/plain;charset=" + encoding);
    response.setCharacterEncoding(encoding);
    try {
      PrintWriter pw = response.getWriter();
      JSONArray array = new JSONArray();
      List<Goods> list = goodsService.getWellSaleGoods(1, 4).getContent();
      for (Goods goods : list) {
        JSONObject obj = new JSONObject();
        obj.put("goods_id", goods.getGoodsId());
        obj.put("img", goods.getImg());
        obj.put("name", goods.getName());
        obj.put("unitPrice", goods.getUnitPrice());
        array.put(obj);
      }
      pw.println(array.toString());
      pw.flush();
      pw.close();
    } catch (IOException | JSONException e) {
      e.printStackTrace();
    }
  }
}
