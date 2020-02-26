package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSysUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:31
 */
public interface ZxwxSysUserRepository extends JpaSpecificationExecutor<ZXwxSysUser>, JpaRepository<ZXwxSysUser, Integer> {
    ZXwxSysUser findById( Integer id);
    ZXwxSysUser findBySchoolId(Integer schoolId);
    ZXwxSysUser findBySysNameAndStatus( String sysName, Integer  status);
    ZXwxSysUser findBySysName (String sysName);
    @Transactional
    @Modifying
    @Query(value = "update zxwx_sys_user u set u.pwd = ?1 where u.id = ?2", nativeQuery = true)
    int changePwdById( String pwd, Integer id);
}
