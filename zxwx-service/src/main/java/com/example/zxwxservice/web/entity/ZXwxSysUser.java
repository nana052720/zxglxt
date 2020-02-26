package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:40
 */
@Data
@Entity
@Table(name="zxwx_sys_user")
public class ZXwxSysUser {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "sys_name")
    private String sysName; //用户名称

    @Column(name = "sys_full_name")
    private String sysFullName; //用户全名

    @Column(name = "pwd")
    private String pwd; //登录密码

    @Column(name = "status")
    private Integer status; //是否有效

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间


    @Column(name = "school_id")
    private Integer schoolId;   //学校表中的id字段

}
