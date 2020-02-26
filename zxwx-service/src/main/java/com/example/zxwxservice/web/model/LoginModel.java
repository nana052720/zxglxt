package com.example.zxwxservice.web.model;

import lombok.Data;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:52
 */
@Data
public class LoginModel {
//    private Integer type;            // 登录方式
    private String loginName;       // 登录名
    private String loginPwd;        // 登录密码
}
