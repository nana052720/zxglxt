package com.example.zxwxservice.web.model;

import lombok.Data;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 21:11
 */
@Data
public class SchoolNameModel {
    private Integer id;
    private String name;    //学校名称
    private String province;     // 省
    private String city;     // 市
    private String county;   // 县
    private String address;     // 地址
    private Integer charge; //是否收费
    private String expireTime;  //到期时间
    private String sysName;     //管理员账号
    private String pwd;     //  密码
    private Integer chargeMoney; //学校收费金额
    private String sysFullName;//管理员昵称
    private String createTime; //创建时间
    private String bindPwd;      //老师绑定密码
    private String schoolName; //学校名称
}
