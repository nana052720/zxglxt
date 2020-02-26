package com.example.zxwxservice.web.model;

import com.example.zxwxservice.web.entity.ZXwxClass;
import lombok.Data;

import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/26 09:28
 */
@Data
public class ClassModel {
    private Integer adminId;    //班主任Id
    private Integer schoolId; // 学校ID
    private String gradeName; // 年级名称
    private String className; // 班级名称
    private Integer classId;  //班级ID
    private Integer id;        //主键ID
    private String userName;//老师名称
}
