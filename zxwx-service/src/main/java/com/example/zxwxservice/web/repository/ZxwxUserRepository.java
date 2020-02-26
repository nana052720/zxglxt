package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxUser;
import com.example.zxwxservice.web.model.TeacherModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:29
 */
public interface ZxwxUserRepository extends JpaSpecificationExecutor<ZXwxUser>, JpaRepository<ZXwxUser, Integer> {
   ZXwxUser findBySchoolIdAndUserNameAndStatusAndRole(Integer schoolId, String userName, Integer status, String role);
   ZXwxUser findBySchoolIdAndStudentIdAndStatusAndRole(Integer schoolId,  String studentId, Integer status, String role);
   ZXwxUser  findByIdAndStatus(Integer id,Integer status);
   List<ZXwxUser> findByRoleAndStatus(String role,Integer status);
    Integer countByStatus(Integer status);
    List<ZXwxUser> findByStatus(Integer status);
    Integer countByVipStatus(Integer status);
    List<ZXwxUser> findBySchoolIdAndStatus (Integer schoolId,Integer status);
    List<ZXwxUser> findBySchoolIdAndStatusAndVipStatus (Integer schoolId,Integer status,Integer vipStatus);
//    @Query(value = "SELECT * FROM zxwx_user u WHERE u.id IN (SELECT distinct(user_id) FROM zxwx_user_class_map WHERE class_id IN (?1)) AND u.role=?2 ORDER BY id DESC", nativeQuery = true)
//    List<ZXwxUser> findBaseInfoByClassIdsAndRole(Collection listIds, String role);
    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_user SET status=0 WHERE id IN (?1)", nativeQuery = true)
    int deleteByIds(Collection listUserIds);

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_user SET user_name=?1,phone=?2 WHERE id = ?3", nativeQuery = true)
    int modifyTeacherInfoById(String userName, String phone, Integer id);
    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_user SET user_name=?1,student_id=?2 WHERE id = ?3", nativeQuery = true)
    int modifyStudentInfoById (String userName, String studentId, Integer id);
}
