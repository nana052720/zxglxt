package com.example.zxwxservice.web.specification;

import com.example.zxwxservice.web.entity.ZXwxSchool;
import com.example.zxwxservice.web.entity.ZXwxSysUser;
import com.example.zxwxservice.web.entity.ZXwxUser;
import com.example.zxwxservice.web.model.SchoolNameModel;
import com.example.zxwxservice.web.model.TeacherModel;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/25 10:08
 */
public class MySpecification {

    public static Specification<ZXwxSchool> getAllSchool( SchoolNameModel request){
        return new Specification<ZXwxSchool>(){
            @Override
            public Predicate toPredicate( Root<ZXwxSchool> root, CriteriaQuery<?> query, CriteriaBuilder cb){
                List<Predicate> predicate = new ArrayList<> ();

                if (!request.getName ().equals ( "" )){
                    predicate.add(cb.like(root.get("schoolName").as(String.class), "%" + request.getName() + "%"));
                }
                predicate.add(cb.equal(root.get("status").as(Integer.class), 1));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }
    public static Specification<ZXwxUser> getUsersWithSchoolId (final TeacherModel request){
        return new Specification<ZXwxUser>(){
            @Override
            public Predicate toPredicate(Root<ZXwxUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();

                if(!request.getUserName ().equals("")){
                    predicate.add(cb.like(root.get("userName").as(String.class), "%" + request.getUserName () + "%"));
                }
                if(!request.getRole().equals("")){
                    predicate.add(cb.equal(root.get("role").as(String.class), request.getRole()));
                }
                predicate.add(cb.equal(root.get("schoolId").as(Integer.class), request.getSchoolId()));
                predicate.add(cb.equal(root.get("status").as(Integer.class), 1));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }
    public static Specification<ZXwxUser> getUsersWithSchoolIdForStudent(final TeacherModel request ){
        return new Specification<ZXwxUser>(){
            @Override
            public Predicate toPredicate(Root<ZXwxUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();

                if(!request.getUserName ().equals("")){
                    predicate.add(cb.like(root.get("userName").as(String.class), "%" + request.getUserName () + "%"));
                }
//                if(!request.getStudentId().equals("")){
//                    predicate.add(cb.like(root.get("studentId").as(String.class), "%" + request.getStudentId() + "%"));
//                }
                if(!request.getRole().equals("")){
                    predicate.add(cb.equal(root.get("role").as(String.class), request.getRole()));
                }
                predicate.add(cb.equal(root.get("schoolId").as(Integer.class), request.getSchoolId()));
                predicate.add(cb.equal(root.get("status").as(Integer.class), 1));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }
    public static Specification<ZXwxUser> getUsersWithSchoolIdForStudentS(final TeacherModel request ){
        return new Specification<ZXwxUser>(){
            @Override
            public Predicate toPredicate(Root<ZXwxUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();

                if(!request.getUserName ().equals("")){
                    predicate.add(cb.like(root.get("userName").as(String.class), "%" + request.getUserName () + "%"));
                }
                if(!request.getRole().equals("")){
                    predicate.add(cb.equal(root.get("role").as(String.class), request.getRole()));
                }
                predicate.add(cb.equal(root.get("status").as(Integer.class), 1));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }
    public static Specification<ZXwxSysUser> getAllSysName( SchoolNameModel request){
        return new Specification<ZXwxSysUser>(){
            @Override
            public Predicate toPredicate( Root<ZXwxSysUser> root, CriteriaQuery<?> query, CriteriaBuilder cb){
                List<Predicate> predicate = new ArrayList<> ();

                if (!request.getSysName ().equals ( "" )){
                    predicate.add(cb.like(root.get("sysName").as(String.class), "%" + request.getSysName () + "%"));
                }
                predicate.add(cb.equal(root.get("status").as(Integer.class), 1));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
    }
}
