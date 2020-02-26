package com.example.zxwxservice.web.model;

import lombok.Data;

/**
 * @Auther: lilun
 * @Date: 2019/4/3 14:45
 */
@Data
public class VipLogModel {
    private String createTime;//操作时间
    private String appId;//被微信支付的小程序APPID
    private String mchId;//被微信支付的小程序APPID
    private String openId;//微信唯一值
    private String orderCode;//订单号
    private Integer totalFee;//金额
    private String state;//订单状态
    private String attach;//用户ID，
}
