package com.example.zxwxservice.web.controller;

import com.example.zxwxservice.web.common.BaseHelper;
import com.example.zxwxservice.web.entity.*;
import com.example.zxwxservice.web.model.ClassModel;
import com.example.zxwxservice.web.model.IndexNunModel;
import com.example.zxwxservice.web.model.TeacherModel;
import com.example.zxwxservice.web.repository.*;
import com.example.zxwxservice.web.specification.MySpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/25 21:02
 */
@CrossOrigin
@RestController
@RequestMapping("/api/school")
public class SchoolController {
    @Autowired
    ZxwxClassRepository zxwxClassRepository;
    @Autowired
    ZxwxUserRepository zxwxUserRepository;
    @Autowired
    ZxwxUserClassMapRepository zxwxUserClassMapRepository;
    @Autowired
    ZxwxBindRepository zxwxBindRepository;
    @Autowired
    ZxwxSubjeckRepository zxwxSubjeckRepository;
    @Autowired
    ZxwxBindRoleRepository zxwxBindRoleRepository;
    @Autowired
    ZxwxSysUserRepository zxwxSysUserRepository;

    //增加班级
    @RequestMapping(value = "/addClass", method = RequestMethod.POST)
    public Integer addClass( @RequestBody ClassModel request ) throws ServletException {
        Integer doState = 0;

        // 根据年级名称、班级名称、学校ID判断是否已经存在
        ZXwxClass zXwxClass = zxwxClassRepository.findBySchoolIdAndClassNameAndGradeName ( request.getSchoolId (), request.getClassName (), request.getGradeName () );
        if (zXwxClass != null) {
            doState = -1; // 已存在
        } else {
            ZXwxClass zXwxClass1 = new ZXwxClass ();
            zXwxClass1.setClassName ( request.getClassName () );
            zXwxClass1.setGradeName ( request.getGradeName () );
            zXwxClass1.setSchoolId ( request.getSchoolId () );
            zXwxClass1 = zxwxClassRepository.save ( zXwxClass1 );
            if (zXwxClass1 != null) {
                doState = 1;
            } else {
                doState = 0;
            }
        }
        return doState;
    }

    //获取所有班级信息
    @RequestMapping(value = "/getClassInfo", method = RequestMethod.POST)
    public List<ClassModel> getClassInfo( @RequestBody ClassModel request ) throws ServletException {
        List<ClassModel> listClassModel = new ArrayList<> ();

        List<ZXwxClass> listZXwxClass = zxwxClassRepository.findBySchoolId ( request.getSchoolId () );
        for (int i = 0; i < listZXwxClass.size (); ++i) {
            ZXwxUser zXwxUser = null;
            ClassModel classModel = new ClassModel ();
            classModel.setClassId ( listZXwxClass.get ( i ).getId () );
            classModel.setClassName ( listZXwxClass.get ( i ).getClassName () );
            classModel.setGradeName ( listZXwxClass.get ( i ).getGradeName () );
            classModel.setAdminId ( listZXwxClass.get ( i ).getAdminId () );
            zXwxUser = zxwxUserRepository.findByIdAndStatus ( listZXwxClass.get ( i ).getAdminId (), 1 );
            if (zXwxUser != null) {
                classModel.setUserName ( zXwxUser.getUserName () );
            }
            listClassModel.add ( classModel );
        }
        return listClassModel;
    }

    //删除班级
    @RequestMapping(value = "/deleteClassInfo", method = RequestMethod.POST)
    public Integer deleteClassInfo( @RequestBody Integer[] request ) throws ServletException {
        Integer doState = 0;

        Collection listClassIds = new ArrayList ();
        for (int i = 0; i < request.length; ++i) {
            listClassIds.add ( request[i] );
        }


        doState = zxwxClassRepository.deleteByIds ( listClassIds );

        return doState;
    }

    //添加老师
    @RequestMapping(value = "/addTeacherBaseInfo", method = RequestMethod.POST)
    public Integer addTeacherBaseInfo( @RequestBody TeacherModel request ) throws ServletException {
        Integer doState = 0;
        ZXwxUser zXwxUser = new ZXwxUser ();
        ZXwxSubject zXwxSubject = new ZXwxSubject ();
        // 判断是否已经存在该老师
        zXwxUser = zxwxUserRepository.findBySchoolIdAndUserNameAndStatusAndRole ( request.getSchoolId (), request.getUserName (), 1, request.getRole () );
        if (zXwxUser != null) {
            doState = -1; // 已存在
        } else {
            zXwxUser = new ZXwxUser ();
            zXwxUser.setUserName ( request.getUserName () );
            zXwxUser.setSchoolId ( request.getSchoolId () );
            zXwxUser.setPhone ( request.getPhone () );
            zXwxUser.setRole ( "老师" );
            zXwxUser.setStatus ( 1 );
            zXwxUser.setSex ( "男" );
            String tmpSubjectString = "";
            for (int i = 0; i < request.getClassSubject ().size (); ++i) {
                String[] tmpArr = request.getClassSubject ().get ( i ).split ( "#" );
                if (tmpSubjectString.equals ( "" )) {
                    tmpSubjectString = tmpArr[1];
                } else {
                    tmpSubjectString = tmpSubjectString + "#" + tmpArr[1];
                }
            }
            zXwxSubject.setSubjectName ( tmpSubjectString );
            zXwxUser = zxwxUserRepository.save ( zXwxUser );
            if (zXwxUser != null) {
                for (int i = 0; i < request.getClassSubject ().size (); ++i) {
                    String[] tmpArr = request.getClassSubject ().get ( i ).split ( "#" );
                    ZXwxUserClassMap zXwxUserClassMap = new ZXwxUserClassMap ();
                    zXwxUserClassMap.setUserId ( zXwxUser.getId () );
                    zXwxUserClassMap.setClassId ( Integer.parseInt ( tmpArr[0] ) );
                    zXwxUserClassMap.setSubjects ( tmpArr[1] );
                    zXwxUserClassMap = zxwxUserClassMapRepository.save ( zXwxUserClassMap );
                    if (zXwxUserClassMap != null) {
                        doState++;
                        if (tmpSubjectString.equals ( "" )) {
                            tmpSubjectString = tmpArr[1];
                        } else {
                            tmpSubjectString = tmpSubjectString + "#" + tmpArr[1];
                        }
                    }
                }
            }
        }
        return doState;
    }

    //获取所有老师信息
    @RequestMapping(value = "/getTeacherBaseInfo", method = RequestMethod.POST)
    public List<TeacherModel> getTeacherBaseInfo( @RequestBody TeacherModel request ) throws ServletException {
        List<TeacherModel> listTeacherModel = new ArrayList<> ();

        List<ZXwxUser> listZXwxUser = new ArrayList<> ();
        List<ZXwxClass> lsitZXwxClass = new ArrayList<> ();
        List<ZXwxClass> lsitZXwxClass2 = new ArrayList<> ();
        List<ZXwxBind> lsitZXwxBind = new ArrayList<> ();
        String openId = "";
        String phones = "";

        listZXwxUser = zxwxUserRepository.findAll ( MySpecification.getUsersWithSchoolId ( request ) );
        for (int j = 0; j < listZXwxUser.size (); ++j) {
            TeacherModel teacherModel = new TeacherModel ();
            teacherModel.setUserName ( listZXwxUser.get ( j ).getUserName () );
            teacherModel.setUserId ( listZXwxUser.get ( j ).getId () );
            // 根据用户ID得到绑定的微信唯一ID，即OpenId
            lsitZXwxBind = zxwxBindRepository.findByUserId ( listZXwxUser.get ( j ).getId () );
            for (int k = 0; k < lsitZXwxBind.size (); ++k) {
                if (openId.equals ( "" )) {
                    openId = lsitZXwxBind.get ( k ).getOpenId ();
                    //只获取user表的老师手机号码
//                    phones = phones + "," + lsitZXwxBind.get ( k ).getPhone ();
                } else {
                    openId = openId + "," + lsitZXwxBind.get ( k ).getOpenId ();
//                    phones = phones + "," + lsitZXwxBind.get ( k ).getPhone ();
                }
            }
            teacherModel.setOpenId ( openId );
            if (phones.equals ( "" )) {
                phones = listZXwxUser.get ( j ).getPhone () == null ? "" : listZXwxUser.get ( j ).getPhone ();
            }
            teacherModel.setPhone ( phones );
            lsitZXwxClass2 = zxwxClassRepository.findClassInfoByUserId ( listZXwxUser.get ( j ).getId () );
            String tmpClassInfo = "";
            List<String> listClassInfo = new ArrayList<> ();
            List<Integer> listClassInfoId = new ArrayList<> ();
            for (int a = 0; a < lsitZXwxClass2.size (); ++a) {
                tmpClassInfo = lsitZXwxClass2.get ( a ).getGradeName () + "-" + lsitZXwxClass2.get ( a ).getClassName ();
                Collection co = new ArrayList ();
                ZXwxUserClassMap zXwxUserClassMap = zxwxUserClassMapRepository.findFirstByClassIdAndUserId ( lsitZXwxClass2.get ( a ).getId (), listZXwxUser.get ( j ).getId () );
                if (zXwxUserClassMap != null) {
                    String[] strArr = zXwxUserClassMap.getSubjects ().split ( "," );
                    for (int x = 0; x < strArr.length; ++x) {
                        co.add ( Integer.parseInt ( strArr[x].equals ( "" ) ? "0" : strArr[x] ) );
                    }
                    List<ZXwxSubject> listZXwxSubject = zxwxSubjeckRepository.findByIdIn ( co );
                    String tmpString = "";
                    for (int t = 0; t < listZXwxSubject.size (); ++t) {
                        if (tmpString.equals ( "" )) {
                            tmpString = listZXwxSubject.get ( t ).getSubjectName ();
                        } else {
                            tmpString = tmpString + "," + listZXwxSubject.get ( t ).getSubjectName ();
                        }
                    }
                    tmpClassInfo = tmpClassInfo + "-" + tmpString;
                }

                // 判断是否为班主任
                lsitZXwxClass = zxwxClassRepository.findByAdminIdAndId ( listZXwxUser.get ( j ).getId (), lsitZXwxClass2.get ( a ).getId () );
                if (lsitZXwxClass.size () != 0) {
                    tmpClassInfo = tmpClassInfo + "-" + "班主任";
                } else {
                }
                listClassInfo.add ( tmpClassInfo );
                listClassInfoId.add ( lsitZXwxClass2.get ( a ).getId () );
            }
            tmpClassInfo = "";
            for (int w = 0; w < listClassInfo.size (); ++w) {
                if (tmpClassInfo.equals ( "" )) {
                    tmpClassInfo = listClassInfo.get ( w );
                } else {
                    tmpClassInfo = tmpClassInfo + "#" + listClassInfo.get ( w );
                }
            }
            teacherModel.setClassInfo ( tmpClassInfo );

            teacherModel.setClassInfoId ( listClassInfoId );

            listTeacherModel.add ( teacherModel );
            openId = "";
            phones = "";
        }
        return listTeacherModel;
    }

    // 获取所有科目
    @RequestMapping(value = "/getAllSubject", method = RequestMethod.GET)
    public List<ZXwxSubject> getAllSubject( HttpServletRequest req ) throws ServletException {
        List<ZXwxSubject> lisZXwxSubject = new ArrayList<> ();

        lisZXwxSubject = zxwxSubjeckRepository.findAll ();

        return lisZXwxSubject;
    }

    //删除普通用户信息
    @RequestMapping(value = "/deleteUserInfo", method = RequestMethod.POST)
    public Integer deleteUserInfo( @RequestBody Integer[] request ) throws ServletException {
        Integer doState = 0;

        Collection ids = new ArrayList ();
        for (int i = 0; i < request.length; ++i) {
            ids.add ( request[i] );
        }

        doState = zxwxUserRepository.deleteByIds ( ids );
        return doState;
    }

    // 根据老师ID解除绑定
    @RequestMapping(value = "/unBindTeacher", method = RequestMethod.POST)
    public Integer unBindTeacher( @RequestBody Integer[] request ) throws ServletException {
        Integer doState = 0;

        Collection ids = new ArrayList ();
        for (int i = 0; i < request.length; ++i) {
            ids.add ( request[i] );
        }

        doState = zxwxBindRepository.unBindByIds ( ids );

        return doState;
    }

    // 导入老师信息
    @RequestMapping(value = "/ImportTeacherInfos", method = RequestMethod.POST)
    public Integer ImportTeacherInfos( @RequestBody List<TeacherModel> request ) throws ServletException {
        Integer doState = 0;

        //获取所有科目信息
        List<ZXwxSubject> listZXwxSubject = new ArrayList<> ();
        listZXwxSubject = zxwxSubjeckRepository.findAll ();

        ZXwxUser zXwxUser = new ZXwxUser ();
        for (int i = 0; i < request.size (); ++i) {
            //判断是否已存在
            zXwxUser = zxwxUserRepository.findBySchoolIdAndUserNameAndStatusAndRole ( request.get ( i ).getSchoolId (), request.get ( i ).getUserName (), 1, "老师" );
            if (zXwxUser != null) {

                continue;
            } else {
                // 处理一下科目信息，将科目名称换成科目表的ID
                // 然后再save
                String tmpSubjectId = "";
                String tmpSubjectId2 = "";
                // 针对一个老师多个版不同授课科目的情况处理

                String[] classSubjectArr = request.get ( i ).getSubject ().split ( "#" );

                for (int q = 0; q < classSubjectArr.length; ++q) {
                    String[] tmpSubjectArr = classSubjectArr[q].split ( "," );
                    for (int m = 0; m < tmpSubjectArr.length; ++m) {
                        for (int w = 0; w < listZXwxSubject.size (); ++w) {
                            if (listZXwxSubject.get ( w ).getSubjectName ().equals ( tmpSubjectArr[m] )) {
                                if (tmpSubjectId.equals ( "" )) {
                                    tmpSubjectId = listZXwxSubject.get ( w ).getId ().toString ();
                                } else {
                                    tmpSubjectId = tmpSubjectId + "," + listZXwxSubject.get ( w ).getId ().toString ();
                                }
                                break;
                            }
                        }
                    }
                    if (tmpSubjectId2.equals ( "" )) {
                        tmpSubjectId2 = tmpSubjectId;
                    } else {
                        tmpSubjectId2 = tmpSubjectId2 + "#" + tmpSubjectId;
                    }
                    tmpSubjectId = "";
                }
                request.get(i).setSubject(tmpSubjectId2);
                String[] tmpSub = tmpSubjectId2.split("#");
                ZXwxUser zXwxUser1 = new ZXwxUser();
                zXwxUser1.setUserName ( request.get ( i ).getUserName () );
                zXwxUser1.setPhone ( request.get ( i ).getPhone () );
                zXwxUser1.setSchoolId (request.get ( i ).getSchoolId ()  );
                zXwxUser1.setRole ( request.get ( i ).getRole () );
                zXwxUser1.setStatus(request.get ( i ).getStatus () );
                zXwxUser1 = zxwxUserRepository.save(  zXwxUser1 );
                if (zXwxUser1 != null) {
                    // 将用户ID和班级ID保存到映射表中
                    if (!request.get(i).getClassId().equals("")) {
                        // 处理多班级情况
                        String[] classArr = request.get(i).getClassId().split(",");
                        for (int k = 0; k < classArr.length; ++k) {
                            ZXwxUserClassMap pkUserClassMap = new ZXwxUserClassMap();
                            pkUserClassMap.setClassId(Integer.parseInt(classArr[k]));
                            pkUserClassMap.setUserId(zXwxUser1.getId());
                            pkUserClassMap.setSubjects(tmpSub[k]);
                            pkUserClassMap = zxwxUserClassMapRepository.save(pkUserClassMap);
                            if (pkUserClassMap != null) {
                                doState = 1;
                            }
                        }
                    }
                }
            }
        }
        return doState;
    }
    //更新学生信息
    @RequestMapping(value = "/updateStudentBaseInfo", method = RequestMethod.POST)
    public Integer updateStudentBaseInfo(@RequestBody TeacherModel request)throws ServletException {
        Integer doState = 0;
        //更新用户表
            //更新用户表
            doState = zxwxUserRepository.modifyStudentInfoById (request.getUserName (), request.getStudentId (), request.getUserId ()  );
            if (doState != 0) {
                // 先删除之前的所有班级信息，然后再保存新的
                doState = zxwxUserClassMapRepository.deleteByUserId ( request.getUserId () );
                if (doState != 0) {
                        ZXwxUserClassMap zXwxUserClassMap = new ZXwxUserClassMap ();
                        zXwxUserClassMap.setUserId ( request.getUserId () );
                        zXwxUserClassMap.setClassId ( Integer.parseInt ( request.getClassInfo () ) );
                        zXwxUserClassMap = zxwxUserClassMapRepository.save ( zXwxUserClassMap );
                        if (zXwxUserClassMap != null) {
                            doState++;
                        }
                }
            }
        return doState;
    }
    // 更新教师信息
    @RequestMapping(value = "/updateTeacherBaseInfo", method = RequestMethod.POST)
    public Integer updateTeacherBaseInfo(@RequestBody TeacherModel request)throws ServletException {

        Integer doState = 0;
        String tmpSubject = "";
        String[] tmpArr;
        for (int i = 0; i < request.getClassSubject().size(); ++i) {
            tmpArr = request.getClassSubject().get(i).split("#");
            if (tmpSubject.equals("")) {
                tmpSubject = tmpArr[1];
            } else {
                tmpSubject = tmpSubject + "#" + tmpArr[1];
            }
        }
        doState=zxwxUserClassMapRepository.modifySubjects(tmpSubject,request.getUserId ());
        if (doState != 0) {
            //更新用户表
            doState = zxwxUserRepository.modifyTeacherInfoById ( request.getUserName (), request.getPhone (), request.getUserId () );
            if (doState != 0) {
                // 先删除之前的所有班级信息，然后再保存新的
                doState = zxwxUserClassMapRepository.deleteByUserId ( request.getUserId () );
                if (doState != 0) {
                    for (int i = 0; i < request.getClassSubject ().size (); ++i) {
                        tmpArr = request.getClassSubject ().get ( i ).split ( "#" );

                        ZXwxUserClassMap zXwxUserClassMap = new ZXwxUserClassMap ();
                        zXwxUserClassMap.setUserId ( request.getUserId () );
                        zXwxUserClassMap.setClassId ( Integer.parseInt ( tmpArr[0] ) );
                        zXwxUserClassMap.setSubjects ( tmpArr[1] );
                        zXwxUserClassMap = zxwxUserClassMapRepository.save ( zXwxUserClassMap );
                        if (zXwxUserClassMap != null) {
                            doState++;
                        }
                    }
                }
            }
        }
        return doState;
    }
    // 设置班主任
    @RequestMapping(value = "/setAdmin", method = RequestMethod.POST)
    public Integer setAdmin(@RequestBody TeacherModel request) throws ServletException {
        Integer doState = 0;

        doState = zxwxClassRepository.setAdminIdToNullByUserId(request.getUserId());
        doState = zxwxClassRepository.setAdminIdByClassId(request.getUserId(), request.getClassInfoId ().get(0));

        return doState;
    }

    // 新增学生信息
    @RequestMapping(value = "/addStudentBaseInfo", method = RequestMethod.POST)
    public Integer addStudentBaseInfo(@RequestBody TeacherModel request)throws ServletException{
        Integer doState = 0;
        ZXwxUser zXwxUser = new ZXwxUser();

        //判断是否已存在该学生
        zXwxUser = zxwxUserRepository.findBySchoolIdAndStudentIdAndStatusAndRole ( request.getSchoolId(), request.getStudentId(), 1, "学生" );
        if (zXwxUser != null) {
            doState = -1; // 已存在
        }else {
            zXwxUser = new ZXwxUser();
            zXwxUser.setUserName ( request.getUserName () );
            zXwxUser.setRole ( "学生" );
            zXwxUser.setSchoolId ( request.getSchoolId () );
            zXwxUser.setStatus ( 1 );
            zXwxUser.setStudentId ( request.getStudentId () );
            zXwxUser.setVipStatus ( 0);
            zXwxUser.setSex ( "男" );
            zXwxUser = zxwxUserRepository.save(zXwxUser);
            if (zXwxUser != null){
                for (int i = 0; i < request.getClassInfoId().size(); ++i) {
                    ZXwxUserClassMap zXwxUserClassMap = new ZXwxUserClassMap();
                    zXwxUserClassMap.setUserId ( zXwxUser.getId () );
                    zXwxUserClassMap.setClassId ( request.getClassInfoId ().get ( i ) );
                    zXwxUserClassMap = zxwxUserClassMapRepository.save(zXwxUserClassMap);
                    if (zXwxUserClassMap != null){
                        doState++;
                    }
                }
            }
        }
        return  doState;
    }
    // 根据学校ID和查询条件获取学生信息
    @RequestMapping(value = "/getStudentBaseInfo", method = RequestMethod.POST)
    public List<TeacherModel> getStudentBaseInfo(@RequestBody TeacherModel request)throws ServletException {
        List<TeacherModel> listTeacherModel = new ArrayList<> ();
        List<ZXwxUser> listZXwxUser = new ArrayList<> ();
        List<ZXwxClass> listZXwxClass = new ArrayList<>();
        List<ZXwxClass> listZXwxClass2 = new ArrayList<>();
        List<ZXwxBind> listZXwxBind = new ArrayList<>();
        List<ZXwxBindRole> listZXwxBindRole = new ArrayList<> ();
        Integer payCount = 0;
        Collection listUserIds = new ArrayList();
        String openId = "";
        String phones = "";

        listZXwxUser = zxwxUserRepository.findAll (MySpecification.getUsersWithSchoolIdForStudent(request));
        for (int j = 0; j < listZXwxUser.size(); ++j) {
            TeacherModel teacherModel = new TeacherModel();
            teacherModel.setUserName (listZXwxUser.get ( j ).getUserName ());
            teacherModel.setUserId(listZXwxUser.get(j).getId());
            teacherModel.setStudentId(listZXwxUser.get(j).getStudentId());
            teacherModel.setVipStatus (listZXwxUser.get(j).getVipStatus () == 0 ? "否" : "是" );
            if (listZXwxUser.get(j).getVipStatus() == 1) {
                payCount++;
            }
            // 根据用户ID得到绑定的微信唯一ID，即OpenId
            listZXwxBind = zxwxBindRepository.findByUserId (listZXwxUser.get ( j ).getId ()  );
            for (int k = 0; k < listZXwxBind.size(); ++k) {
                teacherModel.setUserId (listZXwxUser.get ( j ).getId ()   );
                teacherModel.setBindRoleId ( listZXwxBind.get ( k ).getBindRoleId () );
            listZXwxBindRole = zxwxBindRoleRepository.findById(listZXwxBind.get ( k ).getBindRoleId ());
            for (int m = 0;m < listZXwxBindRole.size ();++m){
                teacherModel.setRoleName ( listZXwxBindRole.get ( m ).getRoleName () );
            }
            if (openId.equals("")) {
                    openId = listZXwxBind.get(k).getOpenId();
                    phones = listZXwxBind.get(k).getPhone();
                } else {
                    openId = openId + "," + listZXwxBind.get(k).getOpenId();
                    phones = phones + "," + listZXwxBind.get(k).getPhone();
                }
            }
            teacherModel.setOpenId ( openId );
            if (phones.equals("")) {
                phones = listZXwxUser.get(j).getPhone() == null ? "" : listZXwxUser.get(j).getPhone();
            }
            teacherModel.setPhone(phones);

            // 班级信息处理
            listZXwxClass2 = zxwxClassRepository.findClassInfoByUserId(listZXwxUser.get(j).getId());
            String tmpClassInfo = "";
            List<String> listClassInfo = new ArrayList<>();
            List<Integer> listClassInfoId = new ArrayList<>();
            for (int a = 0; a < listZXwxClass2.size(); ++a) {
                tmpClassInfo = listZXwxClass2.get(a).getGradeName() + "-" + listZXwxClass2.get(a).getClassName();

                listClassInfo.add(tmpClassInfo);
                listClassInfoId.add(listZXwxClass2.get(a).getId());
            }
            tmpClassInfo = "";
            for (int w = 0; w < listClassInfo.size(); ++w) {
                if (tmpClassInfo.equals("")) {
                    tmpClassInfo = listClassInfo.get(w);
                } else {
                    tmpClassInfo = tmpClassInfo + "," + listClassInfo.get(w);
                }
            }
            teacherModel.setClassInfo ( tmpClassInfo );

            teacherModel.setClassInfoId ( listClassInfoId );
            listTeacherModel.add ( teacherModel );
            openId = "";
            phones = "";
        }
        return listTeacherModel;
    }
    // 导入学生信息
    @RequestMapping(value = "/ImportStudentInfos", method = RequestMethod.POST)
    public Integer ImportStudentInfos(@RequestBody List<TeacherModel> request) throws ServletException {

        Integer doState = 0;
        ZXwxUser zXwxUser = new ZXwxUser();

        for (int i = 0;i < request.size ();++i){
            // 判断是否已经存在
            zXwxUser = zxwxUserRepository.findBySchoolIdAndUserNameAndStatusAndRole ( request.get ( i ).getSchoolId (), request.get ( i ).getUserName (), 1, "老师" );
            if (zXwxUser != null) {
                continue;
            }else {
                ZXwxUser zXwxUser1 = new ZXwxUser();
                zXwxUser1.setUserName ( request.get ( i ).getUserName () );
                zXwxUser1.setSchoolId (request.get ( i ).getSchoolId ()  );
                zXwxUser1.setRole ( request.get ( i ).getRole () );
                zXwxUser1.setStatus(request.get ( i ).getStatus () );
                zXwxUser1.setStudentId ( request.get ( i ).getStudentId () );
                zXwxUser1.setVipStatus ( Integer.valueOf(request.get ( i ).getVipStatus () ));
                zXwxUser1 = zxwxUserRepository.save ( zXwxUser1);
                if (zXwxUser1 != null){
                    // 将用户ID和班级ID保存到映射表中
                    if (!request.get(i).getClassId().equals("")) {
                        // 处理多班级情况
                        String[] classArr = request.get(i).getClassId().split(",");
                        for (int k = 0; k < classArr.length; ++k) {
                            ZXwxUserClassMap zXwxUserClassMap = new ZXwxUserClassMap();
                            zXwxUserClassMap.setClassId(Integer.parseInt(classArr[k]));
                            zXwxUserClassMap.setUserId(zXwxUser1.getId());
                            zXwxUserClassMap = zxwxUserClassMapRepository.save(zXwxUserClassMap);
                            if (zXwxUserClassMap != null) {
                                doState = 1;
                            }
                        }
                    }

                }
            }

        }
        return doState;
    }

    //修改密码
    @RequestMapping(value = "/changeUserPwd",method = RequestMethod.POST)
    public Integer changeUserPwd( HttpServletRequest req, @RequestBody String[] pwd) throws ServletException{
        Integer doState = 0;
        Integer userId = 0;
        if (pwd.length != 0 && pwd.length == 3) {
            userId = Integer.parseInt ( pwd[2] ); // 用户ID
            String md5Pwd = BaseHelper.md5 ( pwd[1] ).toLowerCase (); // 新密码
            String md5Pwd1 = BaseHelper.md5 ( pwd[0] ).toLowerCase (); // 旧密码
            ZXwxSysUser zXwxSysUser = zxwxSysUserRepository.findById ( userId );
            if (zXwxSysUser != null) {
                if (zXwxSysUser.getPwd ().equals ( md5Pwd1 )) {
                    doState = zxwxSysUserRepository.changePwdById ( md5Pwd, userId );
                } else {
                    doState = 2;
                }
            }
        }
        return doState;
    }
   //统计数量
    @RequestMapping(value = "/SchoolCount",method = RequestMethod.POST)
    public IndexNunModel SchoolCount(@RequestBody IndexNunModel request)throws ServletException{

        IndexNunModel indexNunModel = new IndexNunModel();
        //用户总数
        List<ZXwxUser >listZXwxUser = zxwxUserRepository.findBySchoolIdAndStatus(request.getSchoolId (),1);
        indexNunModel.setUserTotal ( listZXwxUser.size () );
        //绑定总数
        if (listZXwxUser.size () !=0){
            Collection listUserIds = new ArrayList();
            for (int i = 0; i < listZXwxUser.size(); ++i){
                listUserIds.add(listZXwxUser.get(i).getId());
            }
            indexNunModel.setBindTotal (zxwxBindRepository.countByUserIdIn ( listUserIds )  );
        }
        List<ZXwxUser >listZXwxUser1 = zxwxUserRepository.findBySchoolIdAndStatusAndVipStatus(request.getSchoolId (),1,1);
        indexNunModel.setVipTotal ( listZXwxUser1.size () );
        return indexNunModel;
    }
}

