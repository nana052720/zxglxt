package com.example.zxwxservice.web.model;

import lombok.Data;

import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/26 16:01
 */
@Data
public class TeacherModel {
    private String vipStatus;//是否会员
    private String studentId;  // 学号
    private String subject; // 科目Id字符串
    private boolean isAdmin; // 班主任
    private String className; // 班级名称
    private Integer schoolId; // 学校ID
    private String gradeName; // 年级名称
    private String userName; //名称
    private String role; //角色
    private Integer status;//是否有效
    private List<String> classSubject; // 班级和科目的字符串
    private Integer userId;  //用户ID
    private String classId; //班级ID
    private String classInfo; // 班级信息
    private List<Integer> classInfoId; //班级信息 ID
    private String phone; // 手机号码
    private String sex;//  性别
    private String roleName;// 绑定人姓名
    private Integer bindRoleId;// 绑定人ID
    private String createTime;//操作时间
    private String appId;//被微信支付的小程序APPID
    private String mchId;//被微信支付的小程序APPID
    private String openId;//微信唯一值
    private String orderCode;//订单号
    private Integer totalFee;//金额
    private String state;//订单状态
    private String attach;//用户ID，
    private String schoolName; //学校名称
}
