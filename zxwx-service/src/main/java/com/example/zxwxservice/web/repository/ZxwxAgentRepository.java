package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxAgent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:30
 */
public interface ZxwxAgentRepository extends JpaSpecificationExecutor<ZXwxAgent>, JpaRepository<ZXwxAgent, Integer> {
}
