package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:26
 */
@Data
@Entity
@Table(name="zxwx_school_notice")
public class ZXwxSchoolNotice {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "school_id")
    private Integer schoolId;   //学校ID

    @Column(name = "title")
    private String title;       //通知标题

    @Column(name = "notice_range")
    private String noticeRange;     //通知范围

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;        //发布时间

    @Column(name = "user_type")
    private Integer userType;       //发布人类型

    @Column(name = "user_id")
    private Integer userId;         //发布人ID

    @Column(name = "user_name")
    private String userName;        //发布人

    @Column(name = "content")
    private String content;         //通知内容
}
