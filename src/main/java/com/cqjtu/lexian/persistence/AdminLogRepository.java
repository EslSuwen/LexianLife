package com.cqjtu.lexian.persistence;

import com.cqjtu.lexian.domain.AdminLog;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * AdminLogRepository
 *
 * @author suwen
 */
public interface AdminLogRepository extends CrudRepository<AdminLog, Integer> {

  List<AdminLog> findAllByAdminId(int id);
}
