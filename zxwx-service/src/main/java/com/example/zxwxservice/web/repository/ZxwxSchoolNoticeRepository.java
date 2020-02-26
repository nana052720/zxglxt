package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSchoolNotice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:33
 */
public interface ZxwxSchoolNoticeRepository extends JpaSpecificationExecutor<ZXwxSchoolNotice>, JpaRepository<ZXwxSchoolNotice, Integer> {
}
