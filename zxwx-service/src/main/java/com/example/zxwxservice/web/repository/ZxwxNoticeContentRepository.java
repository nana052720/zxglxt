package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxNoticeContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:34
 */
public interface ZxwxNoticeContentRepository extends JpaSpecificationExecutor<ZXwxNoticeContent>, JpaRepository<ZXwxNoticeContent, Integer> {
}
