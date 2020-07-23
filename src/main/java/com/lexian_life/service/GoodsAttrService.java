package com.lexian_life.service;

import com.lexian_life.domain.GoodsAttr;

import java.util.List;

/** @author coderWu Created in 下午7:54 17-9-24 */
public interface GoodsAttrService {

  void addAttrs(List<GoodsAttr> attrs);

  void addAttr(GoodsAttr attr);

  void deleteGoodsAttr(int id);

  GoodsAttr hasAttr(String name, String value);

  GoodsAttr findById(int id);

  void deleteAttrByAttrId(int id);
}
