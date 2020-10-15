package com.cqjtu.lexian.service.impl;

import com.cqjtu.lexian.domain.Goods;
import com.cqjtu.lexian.domain.GoodsAttr;
import com.cqjtu.lexian.persistence.GoodsAttrRepository;
import com.cqjtu.lexian.service.GoodsAttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GoodsAttrServiceImpl
 *
 * @author suwen
 */
@Service
public class GoodsAttrServiceImpl implements GoodsAttrService {

  @Autowired GoodsAttrRepository goodsAttrRepository;

  @Override
  public void addAttr(GoodsAttr attr) {
    goodsAttrRepository.save(attr);
  }

  @Override
  public void addAttrs(List<GoodsAttr> attrs) {
    throw new RuntimeException("接口待更新迁移");
    //  TODO 接口待更新迁移   goodsAttrRepository.save(attrs);
  }

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
    return goodsAttrRepository.findById(id).orElseThrow(RuntimeException::new);
  }

  @Override
  public void deleteAttrByAttrId(int id) {
    goodsAttrRepository.deleteById(id);
  }
}
