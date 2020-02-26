package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:11
 */
@Data
@Entity
@Table(name="zxwx_chat")
public class ZXwxChat {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_time")
    private Date createTime;     // 留言时间

    @Column(name = "from_open_id")
    private String fromOpenId;      //来自谁

    @Column(name = "to_open_id")
    private String toOpenId;        //发给谁

    @Column(name = "content")
    private String content;     //留言内容

    @Column(name = "status")
    private Integer status;     //读取状态

    @Column(name = "school_id")
    private Integer schoolId;       //学校ID

    @Column(name = "class_id")
    private Integer classId;        //班级ID
}
