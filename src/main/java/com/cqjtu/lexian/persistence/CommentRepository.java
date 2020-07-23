package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

/** Created by dengxiaobing on 2017/9/22. */
public interface CommentRepository
    extends CrudRepository<Comment, Integer>, PagingAndSortingRepository<Comment, Integer> {
  Page<Comment> findAllByGoodsId(int goodsId, Pageable pageable);

  int countByGoodsIdAndScore(int goods_id, int score);
}
