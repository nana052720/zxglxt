package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxUserClassMap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:33
 */
public interface ZxwxUserClassMapRepository extends JpaSpecificationExecutor<ZXwxUserClassMap>, JpaRepository<ZXwxUserClassMap, Integer> {
    ZXwxUserClassMap findFirstByClassIdAndUserId (Integer classId,Integer userId);
    ZXwxUserClassMap findByUserId (Integer userId);



    @Transactional
    @Modifying
    @Query(value = "DELETE FROM zxwx_user_class_map WHERE user_id = ?1", nativeQuery = true)
    int deleteByUserId(Integer userId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_user_class_map SET subjects=?1 WHERE user_id = ?2", nativeQuery = true)
    int modifySubjects( String subjects, Integer id);
}
