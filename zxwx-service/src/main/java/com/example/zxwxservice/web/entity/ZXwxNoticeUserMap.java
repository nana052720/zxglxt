package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:46
 */
@Data
@Entity
@Table(name="zxwx_notice_user_map")
public class ZXwxNoticeUserMap {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "notice_id")
    private Integer noticeId;       //通知表ID

    @Column(name = "to_user_id")
    private Integer toUserId;       //通知接收人普通用户ID

    @Column(name = "state")
    private Integer state;          //当前状态

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "read_time")
    private Date readTime;          //通知读取时间

}
