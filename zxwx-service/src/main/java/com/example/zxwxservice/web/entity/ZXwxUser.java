package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:07
 */
@Data
@Entity
@Table(name="zxwx_user")
public class ZXwxUser {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "user_name")
    private String userName;     // 用户名称

    @Column(name = "role")
    private String role;    // 老师/学生

    @Column(name = "school_id")
    private Integer schoolId;   // 学校ID

    @Column(name = "student_id")
    private String studentId; //学号

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间

    @Column(name = "sex")
    private String sex;  //性别

    @Column(name = "status")
    private Integer status;     //是否有效

    @Column(name = "vip_status")
    private Integer vipStatus;   //Vip缴费状态

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "vip_expire_time")
    private Date vipExpireTime;     //Vip到期时间

    @Column(name = "phone")
    private String phone;  //老师手机号码
}
