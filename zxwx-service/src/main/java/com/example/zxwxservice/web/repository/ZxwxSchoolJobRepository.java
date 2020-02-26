package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSchoolJob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:35
 */
public interface ZxwxSchoolJobRepository extends JpaSpecificationExecutor<ZXwxSchoolJob>, JpaRepository<ZXwxSchoolJob, Integer> {
}
