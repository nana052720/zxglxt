package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxBind;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:32
 */
public interface ZxwxBindRepository extends JpaSpecificationExecutor<ZXwxBind>, JpaRepository<ZXwxBind, Integer> {
    List<ZXwxBind> findByUserId( Integer userId);
    Integer countByUserIdIn(Collection listUserIds);
    @Transactional
    @Modifying
    @Query(value = "DELETE FROM zxwx_bind WHERE user_id IN (?1)", nativeQuery = true)
    int unBindByIds(Collection listUserIds);
}
