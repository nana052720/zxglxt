package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxNoticeUserMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:34
 */
public interface ZxwxNoticeUserMapRepository extends JpaSpecificationExecutor<ZXwxNoticeUserMap>, JpaRepository<ZXwxNoticeUserMap, Integer> {
}
