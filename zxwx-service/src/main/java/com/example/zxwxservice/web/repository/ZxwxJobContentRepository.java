package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxJobContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:35
 */
public interface ZxwxJobContentRepository extends JpaSpecificationExecutor<ZXwxJobContent>, JpaRepository<ZXwxJobContent, Integer> {
}
