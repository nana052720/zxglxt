package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 09:21
 */

@Data
@Entity
@Table(name="zxwx_vip")
public class ZXwxVip {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "school_id")
    private Integer schoolId;   //学校id

    @Column(name = "image_path")
    private String imagePath;   //图片位置
}
