package com.example.zxwxservice.web.model;

import lombok.Data;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:49
 */
@Data
public class AccessAuthorityResult {
    private boolean login;
    private boolean validate;
    private String message;//用户登录返回信息
    private String sysName;//用户名
    private String sysFullName;//昵称
    private String token;//判断是否为登陆有效
    private Integer schoolId;//学校ID
    private Integer userId;//用户ID
}
