package com.lexian_life.service.impl;

import com.lexian_life.domain.Goods;
import com.lexian_life.domain.GoodsAttr;
import com.lexian_life.persistence.GoodsAttrRepository;
import com.lexian_life.service.GoodsAttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/** @author coderWu Created in 下午7:56 17-9-24 */
@Service
public class GoodsAttrServiceImpl implements GoodsAttrService {

  @Autowired GoodsAttrRepository goodsAttrRepository;

  @Override
  public void addAttr(GoodsAttr attr) {
    goodsAttrRepository.save(attr);
  }

  @Override
  public void addAttrs(List<GoodsAttr> attrs) {
    goodsAttrRepository.save(attrs);
  }

  /** @param id goodsId */
  @Override
  public void deleteGoodsAttr(int id) {
    Goods goods = new Goods();
    goods.setGoodsId(id);
    goodsAttrRepository.deleteAllByGoods(goods);
  }

  @Override
  public GoodsAttr hasAttr(String name, String value) {
    return goodsAttrRepository.findByNameAndValue(name, value);
  }

  @Override
  public GoodsAttr findById(int id) {
    return goodsAttrRepository.findOne(id);
  }

  @Override
  public void deleteAttrByAttrId(int id) {
    goodsAttrRepository.delete(id);
  }
}
