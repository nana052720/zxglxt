package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxBindRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:32
 */
public interface ZxwxBindRoleRepository extends JpaSpecificationExecutor<ZXwxBindRole>, JpaRepository<ZXwxBindRole, Integer> {
    List<ZXwxBindRole> findById( Integer id);
}
