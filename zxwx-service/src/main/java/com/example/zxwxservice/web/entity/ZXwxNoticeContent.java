package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:39
 */
@Data
@Entity
@Table(name="zxwx_notice_content")
public class ZXwxNoticeContent {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "notice_id")
    private Integer noticeId;       //通知表ID

    @Column(name = "content")
    private String content;         //具体通知内容
}
