package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.Comment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import javax.transaction.Transactional;

import java.text.ParseException;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class CommentRepositoryTest {
  @Autowired private CommentRepository commentRepository;

  @Test
  public void testFind() {
    Comment comment = commentRepository.findOne(1);
    System.out.println(comment);
  }

  @Test
  public void testCount() throws ParseException {
    System.out.println(commentRepository.countByGoodsIdAndScore(1, 3));
  }

  @Test
  public void testSave() {
    Comment comment = new Comment();
    comment.setContent("太差了，再也不买这款了");
    comment.setGoodsId(2);
    comment.setCusId(2);
    comment.setScore(0);
    comment.setTime(new Date());
    commentRepository.save(comment);
  }
}
