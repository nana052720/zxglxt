package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:29
 */
@Data
@Entity
@Table(name="zxwx_school")
public class ZXwxSchool {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "school_name")
    private String schoolName;  //学校名称

    @Column(name = "province")
    private String province;    //省

    @Column(name = "city")
    private String city;    //市

    @Column(name = "county")
    private String county;  //县

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间

    @Column(name = "status")
    private Integer status;     //状态

    @Column(name = "agent_id")
    private Integer agentId;    //代理商表ID

    @Column(name = "address")
    private String address;     //学校地址

    @Column(name = "charge_money")
    private Integer chargeMoney;    //学校收费金额

    @Column(name = "charge")
    private Integer charge;         //是否收费

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "expire_time")
    private Date expireTime;        //收费到期时间

    @Column(name = "bind_pwd")
    private String bindPwd;         //老师绑定密码
}
