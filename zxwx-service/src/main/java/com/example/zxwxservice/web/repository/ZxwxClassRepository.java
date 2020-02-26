package com.example.zxwxservice.web.repository;

import com.example.zxwxservice.web.entity.ZXwxClass;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:31
 */
public interface ZxwxClassRepository extends JpaSpecificationExecutor<ZXwxClass>, JpaRepository<ZXwxClass, Integer> {
    ZXwxClass findBySchoolIdAndClassNameAndGradeName(Integer schoolId, String className, String gradeName);
    List<ZXwxClass> findBySchoolId (Integer schoolId);
    List<ZXwxClass> findByAdminIdAndId(Integer adminId, Integer classId);
    List<ZXwxClass> findByGradeName(String gradeName);
    @Query(value = "SELECT * FROM zxwx_class c LEFT JOIN zxwx_user_class_map ucm ON c.id=ucm.class_id WHERE ucm.user_id=?1", nativeQuery = true)
    List<ZXwxClass>findClassInfoByUserId(Integer userId);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM zxwx_class WHERE id IN (?1)", nativeQuery = true)
    int deleteByIds(Collection listClassIds);

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_class SET admin_id=NULL WHERE admin_id=?1", nativeQuery = true)
    int setAdminIdToNullByUserId(Integer userId);  // 取消班主任

    @Transactional
    @Modifying
    @Query(value = "UPDATE zxwx_class SET admin_id=?1 WHERE id=?2", nativeQuery = true)
    int setAdminIdByClassId(Integer userId, Integer classId);
}
