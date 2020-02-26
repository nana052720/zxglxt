package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxImg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:37
 */
public interface ZxwxImgRepository extends JpaSpecificationExecutor<ZXwxImg>, JpaRepository<ZXwxImg, Integer> {
    List<ZXwxImg> findById(Integer id);

    ZXwxImg findFirstById(Integer id);

    @Transactional
    @Modifying
    @Query(value = "update zxwx_img u set u.url= ?1  where u.id=?2",nativeQuery = true)
    int modifyById (String url,Integer id);

    @Transactional
    @Modifying
    @Query(value = "delete from zxwx_img where id = ?1",nativeQuery = true)
    int deleteById (Integer id );
}
