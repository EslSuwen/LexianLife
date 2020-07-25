package com.cqjtu.lexian.service;

import com.cqjtu.lexian.domain.GoodsAttr;

import java.util.List;

/**
 * GoodsAttrService
 *
 * @author suwen
 */
public interface GoodsAttrService {

  void addAttrs(List<GoodsAttr> attrs);

  void addAttr(GoodsAttr attr);

  void deleteGoodsAttr(int id);

  GoodsAttr hasAttr(String name, String value);

  GoodsAttr findById(int id);

  void deleteAttrByAttrId(int id);
}
