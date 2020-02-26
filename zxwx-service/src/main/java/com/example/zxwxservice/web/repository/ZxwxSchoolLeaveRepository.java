package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSchoolLeave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:37
 */
public interface ZxwxSchoolLeaveRepository extends JpaSpecificationExecutor<ZXwxSchoolLeave>, JpaRepository<ZXwxSchoolLeave, Integer> {
}
