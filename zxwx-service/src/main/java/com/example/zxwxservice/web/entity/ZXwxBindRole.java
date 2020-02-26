package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:16
 */
@Data
@Entity
@Table(name="zxwx_bind_role")
public class ZXwxBindRole {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "role_name")
    private String roleName;
}
