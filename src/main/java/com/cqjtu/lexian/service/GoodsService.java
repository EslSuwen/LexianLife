package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.*;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * GoodsService
 *
 * @author suwen
 */
public interface GoodsService {
  /**
   * 通过Goods id获取Goods
   *
   * @param id 商品编号
   * @return 商品信息
   */
  Goods findGoodsById(int id);
  /**
   * 获取主页上显示的Catalog列表,只获取status=1的，并且最多只能返回10个
   *
   * @return 目录列表
   */
  List<Catalog> displayCatalogs();

  /**
   * 商品各类的模糊查询
   *
   * @param categoryName 商品分类名
   * @return 商品分类列表
   */
  List<Category> blurryCategorySearch(String categoryName);

  /**
   * 商品名的模糊查询
   *
   * @param goodName 商品名
   * @return 商品分页
   */
  Page<Goods> blurryGoodsSearch(String goodName, int pageIndex, int sort);

  /**
   * 通过分类编号获取商品分类
   *
   * @param categoryId 商品分类编号
   * @return 商品分类
   */
  Category getCategory(int categoryId);

  /**
   * 分页查询商品
   *
   * @param categoryId 商品分类编号
   * @param pageIndex 分类
   * @param count 数量
   * @param sort 排序
   * @return 商品分页
   */
  Page<Goods> getGoods(int categoryId, int pageIndex, int count, int sort);

  /**
   * 添加关注
   *
   * @param attention 关注信息
   * @return 关注信息
   */
  Attention addAttention(Attention attention);

  /**
   * 获取顾客的关注
   *
   * @param customer 顾客信息
   * @return 顾客关注列表
   */
  List<Attention> getAttention(Customer customer);

  /**
   * 分页查询商品的评论
   *
   * @param goodsId 商品编号
   * @param page 分页数
   * @return 评论分页
   */
  Page<Comment> getComment(int goodsId, int page);

  /**
   * 通过星数获取评论数
   *
   * @param score 评分
   * @param goodsId 商品编号
   * @return 评论数
   */
  int getCommentCountByScore(int goodsId, int score);

  /**
   * 获取商品当前月销量
   *
   * @param goodsId 商品编号
   * @return 月销量
   */
  int getCurMonthSaleCount(int goodsId);

  /**
   * 获取所有商品 TODO 性能优化
   *
   * @return 商品列表
   */
  List<Goods> getAllGoods();

  /**
   * 根据分类获取所有商品
   *
   * @param id 分类编号
   * @return 商品列表
   */
  List<Goods> getGoodsByCategoryId(int id);

  /**
   * 增加商品
   *
   * @param goods 商品信息
   * @return 商品信息
   */
  Goods addGood(Goods goods);

  /**
   * 更新商品
   *
   * @param goods 商品信息
   */
  void updateGoods(Goods goods);

  /**
   * 删除商品
   *
   * @param id 商品编号
   */
  void deleteGoods(int id);

  /**
   * 根据商品编号获取商品信息
   *
   * @param id 商品编号
   * @return 商品信息
   */
  Goods getGoodsById(int id);

  /**
   * 分页查询销量最好的商品
   *
   * @param index 从1开始
   * @param size 数量
   * @return 商品分页
   */
  Page<Goods> getWellSaleGoods(int index, int size);

  /**
   * 商品增加图片
   *
   * @param goods 商品信息
   * @param pics 图片列表
   */
  void addBigPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request);

  /**
   * 商品增加细节图片
   *
   * @param goods 商品信息
   * @param pics 图片列表
   */
  void addAdPicture(Goods goods, MultipartFile[] pics, HttpServletRequest request);
}
