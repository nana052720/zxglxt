package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxJobUserMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:35
 */
public interface ZxwxJobUserMapRepository extends JpaSpecificationExecutor<ZXwxJobUserMap>, JpaRepository<ZXwxJobUserMap, Integer> {
}
