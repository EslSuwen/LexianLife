package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.GoodsAttr;

import java.util.List;

/**
 * GoodsAttrService
 *
 * @author suwen
 */
public interface GoodsAttrService {

  /**
   * 增加多个商品属性
   *
   * @param attrs 商品属性列表
   */
  void addAttrs(List<GoodsAttr> attrs);

  /**
   * 增加商品属性
   *
   * @param attr 商品属性
   */
  void addAttr(GoodsAttr attr);

  /**
   * 删除商品属性
   *
   * @param id 商品属性编号
   */
  void deleteGoodsAttr(int id);

  /**
   * 查找商品属性
   *
   * @param name 商品属性名
   * @param value 商品属性值
   * @return 商品属性
   */
  GoodsAttr hasAttr(String name, String value);

  /**
   * 查找商品属性
   *
   * @param id 商品属性编号
   * @return 商品属性
   */
  GoodsAttr findById(int id);

  /**
   * 删除商品属性
   *
   * @param id 商品属性编号
   */
  void deleteAttrByAttrId(int id);
}
