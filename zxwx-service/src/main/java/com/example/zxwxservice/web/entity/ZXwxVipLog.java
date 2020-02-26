package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:08
 */
@Data
@Entity
@Table(name="zxwx_vip_log")
public class ZXwxVipLog {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 操作时间

    @Column(name = "app_id")
    private String appId;       //被微信支付的小程序APPID

    @Column(name = "mch_id")
    private String mchId;       //被微信支付的小程序商户号

    @Column(name = "open_id")
    private String openId;      //微信唯一值

    @Column(name = "order_code")
    private String orderCode;       //订单号

    @Column(name = "total_fee")
    private Integer totalFee;       //金额

    @Column(name = "state")
    private String state;       //订单状态

    @Column(name = "attach")
    private String attach;      //用户ID

}
