package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxVipLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:37
 */
public interface ZxwxVipLogRepository extends JpaSpecificationExecutor<ZXwxVipLog>, JpaRepository<ZXwxVipLog, Integer> {
    List<ZXwxVipLog> findByAttach (String attach);
}
