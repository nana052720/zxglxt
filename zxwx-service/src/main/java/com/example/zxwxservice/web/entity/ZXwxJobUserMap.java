package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:55
 */
@Data
@Entity
@Table(name="zxwx_job_user_map")
public class ZXwxJobUserMap {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "job_id")
    private Integer jobId;      //作业表ID

    @Column(name = "to_user_id")
    private Integer toUserId;       //作业接收人普通用户ID

    @Column(name = "read_state")
    private Integer readState;      //当前状态

    @Column(name = "submit_state")
    private Integer submitState;      //当前状态

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "read_time")
    private Date readTime;          //作业读取时间

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "submit_time")
    private Date submitTime;        //作业提交时间

    @Column(name = "reply")
    private String reply;       //老师回复内容

    @Column(name = "star")
    private Integer star;       //星星数

    @Column(name = "reply_state")
    private Integer replyState; //  批阅状态

}
