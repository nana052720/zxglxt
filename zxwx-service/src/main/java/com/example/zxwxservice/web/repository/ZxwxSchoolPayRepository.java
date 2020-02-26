package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSchoolPay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:38
 */
public interface ZxwxSchoolPayRepository extends JpaSpecificationExecutor<ZXwxSchoolPay>, JpaRepository<ZXwxSchoolPay, Integer> {
}
