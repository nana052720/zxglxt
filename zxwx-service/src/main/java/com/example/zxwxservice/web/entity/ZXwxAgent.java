package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:21
 */
@Data
@Entity
@Table(name="zxwx_agent")
public class ZXwxAgent {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "agent_name")
    private String agentName;   //代理商名称

    @Column(name = "province")
    private String province;    //省

    @Column(name = "city")
    private String city;    //市

    @Column(name = "county")
    private String county;  //县

    @Column(name = "status")
    private Integer status;     //状态

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 签约时间

    @Column(name = "service_fee")
    private Float serviceFee;   //代理费

    @Column(name = "person")
    private String person;  //负责人

    @Column(name = "phone")
    private String phone;   //负责人手机号码

    @Column(name = "range")
    private String range;   //代理省市县范围

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "expire_time")
    private Date expireTime;    //到期时间
}
