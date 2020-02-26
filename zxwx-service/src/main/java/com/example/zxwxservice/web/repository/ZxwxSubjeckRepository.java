package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxSubject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/26 17:06
 */
public interface ZxwxSubjeckRepository extends JpaSpecificationExecutor<ZXwxSubject>, JpaRepository<ZXwxSubject, Integer> {
    List<ZXwxSubject> findByIdIn(Collection Ids);
    ZXwxSubject findBySubjectName(String subjectName);
}
