package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:13
 */
@Data
@Entity
@Table(name="zxwx_bind")
public class ZXwxBind {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "open_id")
    private String openId;  //  微信的唯一ID

    @Column(name = "user_id")
    private Integer userId; //普通用户表中的id字段

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间

    @Column(name = "bind_role_id")
    private Integer bindRoleId; //绑定角色表中的id字段

    @Column(name = "phone")
    private String phone;       //家长手机号

}
