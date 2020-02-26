package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:53
 */
@Data
@Entity
@Table(name="zxwx_job_content")
public class ZXwxJobContent {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "job_id")
    private Integer jobId;      //作业表ID

    @Column(name = "type")
    private Integer type;       //内容类型

    @Column(name = "content")
    private String content;     //具体作业内容
}
