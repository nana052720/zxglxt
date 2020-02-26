package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:18
 */
@Data
@Entity
@Table(name="zxwx_subject")
public class ZXwxSubject {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "subject_name")
    private String subjectName;     //  科目名称
}
