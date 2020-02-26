package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSchool;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:31
 */
public interface ZxwxSchoolRepository extends JpaSpecificationExecutor<ZXwxSchool>, JpaRepository<ZXwxSchool, Integer> {
    List<ZXwxSchool>findById (Integer id);
    Integer countByStatus (Integer status);
    List<ZXwxSchool> findByStatus (Integer status);
    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_school SET status = 0 WHERE id IN (?1)", nativeQuery = true)
    int delZXwxSchoolByIds(Collection listIds);

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_school SET school_name=?1,address=?2,charge=?3,charge_money=?4,expire_time=?5 WHERE id = ?6", nativeQuery = true)
    int modifyById( String schoolName, String address, Integer charge, Integer chargeMoney, Date expireTime, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_school SET school_name=?1,address=?2,charge=?3 WHERE id = ?4", nativeQuery = true)
    int modifyByIds(String schoolName, String address, Integer charge,Integer id);
}
