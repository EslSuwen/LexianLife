package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.AdminLog;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/** @author coderWu Created in 下午3:45 17-9-26 */
public interface AdminLogRepository extends CrudRepository<AdminLog, Integer> {

  List<AdminLog> findAllByAdminId(int id);
}
