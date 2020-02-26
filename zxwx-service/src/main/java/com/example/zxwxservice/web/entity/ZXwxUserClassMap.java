package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:20
 */
@Data
@Entity
@Table(name="zxwx_user_class_map")
public class ZXwxUserClassMap {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;     //普通用户表ID

    @Column(name = "class_id")
    private Integer classId;    //班级表ID

    @Column(name = "subjects")
    private String subjects;    //科目ID
}
