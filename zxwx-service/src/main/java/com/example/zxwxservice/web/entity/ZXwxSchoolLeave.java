package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:04
 */
@Data
@Entity
@Table(name="zxwx_school_leave")
public class ZXwxSchoolLeave {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "school_id")
    private Integer schoolId;       //学校ID

    @Column(name = "user_id")
    private Integer userId;         //学生ID

    @Column(name = "date_time")
    private String dateTime;        //请假日期

    @Column(name = "approver_id")
    private Integer approverId;     //审批人ID

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 创建时间

    @Column(name = "state")
    private String state;       //待处理

    @Column(name = "content")
    private String content;     //具体请假内容

}
