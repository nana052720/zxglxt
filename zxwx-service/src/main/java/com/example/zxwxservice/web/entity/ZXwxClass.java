package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:36
 */
@Data
@Entity
@Table(name="zxwx_class")
public class ZXwxClass {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "class_name")
    private String className;       //班级名称

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间

    @Column(name = "admin_id")
    private Integer adminId;    //班主任ID-普通用户表中的id字段

    @Column(name = "grade_name")
    private String gradeName;   //年级名称

    @Column(name = "school_id")
    private Integer schoolId;   //学校表中的id字段
}
