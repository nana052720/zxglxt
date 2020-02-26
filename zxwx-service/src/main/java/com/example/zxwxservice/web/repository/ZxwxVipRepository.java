package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxVip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:33
 */
public interface ZxwxVipRepository extends JpaSpecificationExecutor<ZXwxVip>, JpaRepository<ZXwxVip, Integer> {

    Integer countBySchoolIdIn(Collection listUserIds1);
    @Transactional
    @Modifying
    @Query(value = "delete from zxwx_vip where id =?1",nativeQuery = true)
    int deleteById( Integer id);

    @Transactional
    @Modifying
    @Query(value = "delete from zxwx_vip",nativeQuery = true)
    int deleteAllInfo( );
}
