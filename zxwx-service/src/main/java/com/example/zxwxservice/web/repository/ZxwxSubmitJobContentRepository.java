package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSubmitJobContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:36
 */
public interface ZxwxSubmitJobContentRepository extends JpaSpecificationExecutor<ZXwxSubmitJobContent>, JpaRepository<ZXwxSubmitJobContent, Integer> {
}
