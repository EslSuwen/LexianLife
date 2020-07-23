package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.BrowseRecord;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/** Created by dengxiaobing on 2017/9/24. */
public interface BrowseRecordRespository
    extends CrudRepository<BrowseRecord, Integer>,
        PagingAndSortingRepository<BrowseRecord, Integer> {
  Page<BrowseRecord> findAllByCustomer(Customer customer, Pageable pageable);

  /**
   * 获取顾客最近的浏览记录并按商品进行分组
   *
   * @param customer
   * @param pageable
   * @return
   */
  // 这里的这个自定义查询是比较复杂的，性能我还没有分析，基本思想就是最外层查BrowseRecord并根据goods_id进行分组，然后查出的time=在当前goods_id的所有记录中时间最大的，这样就查出了所需的结果了
  @Query(
      value =
          "select br from BrowseRecord br where br.customer=?1 and br.time=(select max(xbr.time) from BrowseRecord xbr where xbr.goods=br.goods) group by br.goods.goodsId")
  Page<BrowseRecord> list(Customer customer, Pageable pageable);

  List<BrowseRecord> findAllByCustomer_CusId(int id);
}
