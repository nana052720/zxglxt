package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:15
 */

@Data
@Entity
@Table(name="zxwx_school_charge")
public class ZXwxSchoolCharge {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "charge_name")
    private String chargeName;      //收费名称

    @Column(name = "total_fee")
    private Integer totalFee;       //收费金额

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 留言时间

    @Column(name = "school_id")
    private Integer schoolId;       //学校ID

    @Column(name = "class_id")
    private Integer classId;        //班级ID
}
