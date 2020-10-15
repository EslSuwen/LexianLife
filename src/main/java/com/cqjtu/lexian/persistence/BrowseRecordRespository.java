package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.BrowseRecord;
import com.cqjtu.lexian.domain.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * BrowseRecordRespository
 *
 * @author suwen
 */
public interface BrowseRecordRespository
    extends CrudRepository<BrowseRecord, Integer>,
        PagingAndSortingRepository<BrowseRecord, Integer> {
  Page<BrowseRecord> findAllByCustomer(Customer customer, Pageable pageable);

  /**
   * 获取顾客最近的浏览记录并按商品进行分组
   *
   * @param customer 用户信息
   * @param pageable 分页
   * @return 用户浏览记录
   *     <p>todo 这个自定义查询比较复杂的，可以优化性能， todo 基本思想就是最外层查BrowseRecord并根据goods_id进行分组， todo
   *     然后查出的time=在当前goods_id的所有记录中时间最大的，这样就查出了所需的结果了
   */
  @Query(
      value =
          "select br from BrowseRecord br where br.customer=?1 and br.time=(select max(xbr.time) from BrowseRecord xbr where xbr.goods=br.goods) group by br.goods.goodsId")
  Page<BrowseRecord> list(Customer customer, Pageable pageable);

  List<BrowseRecord> findAllByCustomer_CusId(int id);
}
