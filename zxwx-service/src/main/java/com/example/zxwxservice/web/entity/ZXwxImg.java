package com.example.zxwxservice.web.entity;

import lombok.Data;

import javax.persistence.*;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 10:03
 */

@Data
@Entity
@Table(name="zxwx_img")
public class ZXwxImg {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "src_path")
    private String srcPath;     //图片服务器相对路径

    @Column(name = "url")
    private String url;         //点击跳转页面
}
