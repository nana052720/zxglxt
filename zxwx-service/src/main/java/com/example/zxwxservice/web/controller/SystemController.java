package com.example.zxwxservice.web.controller;

import com.example.zxwxservice.web.common.BaseHelper;
import com.example.zxwxservice.web.common.MyDateUtil;
import com.example.zxwxservice.web.entity.*;
import com.example.zxwxservice.web.model.*;
import com.example.zxwxservice.web.repository.*;
import com.example.zxwxservice.web.specification.MySpecification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 21:15
 */
@CrossOrigin
@RestController
@RequestMapping("/api/system")
public class SystemController {
    @Autowired
    ZxwxSchoolRepository zxwxSchoolRepository;
    @Autowired
    ZxwxSysUserRepository zxwxSysUserRepository;
    @Autowired
    ZxwxSubjeckRepository zxwxSubjeckRepository;
    @Autowired
    ZxwxVipLogRepository zxwxVipLogRepository;
    @Autowired
    ZxwxVipRepository zxwxVipRepository;
    @Autowired
    ZxwxUserRepository zxwxUserRepository;
    @Autowired
    ZxwxBindRepository zxwxBindRepository;
    @Autowired
    ZxwxClassRepository zxwxClassRepository;
    @Autowired
    ZxwxUserClassMapRepository zxwxUserClassMapRepository;
    @Autowired
    ZxwxBindRoleRepository zxwxBindRoleRepository;
    @Autowired
    ZxwxImgRepository zxwxImgRepository;

        //添加学校
    @RequestMapping(value = "/addOneSchoolWithSysUser", method = RequestMethod.POST)
    public Integer addOneSchoolWithSysUser( @RequestBody SchoolNameModel request ) throws ServletException, ParseException {
        Integer doState = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ZXwxSchool zXwxSchool = new ZXwxSchool ();
        ZXwxSysUser zXwxSysUser = new ZXwxSysUser ();
        ZXwxSysUser zXwxSysUser1 = zxwxSysUserRepository.findBySysName (  request.getSysName ());
        if (zXwxSysUser1 != null){
            doState = -1;
            return doState;
        }
        zXwxSchool.setSchoolName ( request.getName () );
        zXwxSchool.setAddress ( request.getAddress() );
        zXwxSchool.setCharge ( request.getCharge () );
        zXwxSchool.setCity ( request.getCity () );
//        String md5Pwd1 = BaseHelper.md5 ( request.getBindPwd () ).toLowerCase ();
        zXwxSchool.setBindPwd ( request.getBindPwd () );
        if (request.getCharge () == 1){
            zXwxSchool.setChargeMoney ( request.getChargeMoney () );
            zXwxSchool.setExpireTime  ( sdf.parse (request.getExpireTime ()  ) );
        }
        zXwxSchool.setProvince ( request.getProvince () );
        zXwxSchool.setCounty ( request.getCounty () );
        zXwxSchool.setStatus ( 1 );
        zXwxSchool = zxwxSchoolRepository.save ( zXwxSchool);
        if (zXwxSchool != null){

                zXwxSysUser.setSysName ( request.getSysName () );
                zXwxSysUser.setSysFullName ( zXwxSchool.getSchoolName ());
                zXwxSysUser.setPwd ( BaseHelper.md5(request.getPwd ()).toLowerCase() );
                zXwxSysUser.setStatus ( 1 );
                zXwxSysUser.setSchoolId (zXwxSchool.getId ());
                zXwxSysUser = zxwxSysUserRepository.save ( zXwxSysUser );
                if (zXwxSysUser != null){
                    doState =1;
                }
            }
        return doState;
    }

    //获取学校信息
    @RequestMapping(value = "/getSchool",method = RequestMethod.POST)
    public List<SchoolNameModel> getSchool(@RequestBody SchoolNameModel request)throws ServletException{
        List<SchoolNameModel> listSchoolNameModel = new ArrayList<> ();
        List<ZXwxSchool> listZXwxSchool = zxwxSchoolRepository.findAll ( MySpecification.getAllSchool (request));
        for (int i = 0; i < listZXwxSchool.size ();++i){
            SchoolNameModel schoolNameModel = new SchoolNameModel();
            schoolNameModel.setId ( listZXwxSchool.get ( i ).getId () );
            schoolNameModel.setName ( listZXwxSchool.get ( i ).getSchoolName () );
            schoolNameModel.setProvince ( listZXwxSchool.get ( i ).getProvince () );
            schoolNameModel.setCity ( listZXwxSchool.get ( i ).getCity () );
            schoolNameModel.setCounty ( listZXwxSchool.get ( i ).getCounty () );
            schoolNameModel.setAddress ( listZXwxSchool.get ( i ).getAddress () );
            schoolNameModel.setChargeMoney (listZXwxSchool.get ( i ).getChargeMoney ());
            schoolNameModel.setCharge ( listZXwxSchool.get ( i ).getCharge () );
            schoolNameModel.setCreateTime ( MyDateUtil.formatToString ( "yyyy-MM-dd HH:mm:ss", listZXwxSchool.get ( i ).getCreateTime () ) );
            schoolNameModel.setExpireTime ( listZXwxSchool.get ( i ).getExpireTime () == null ? "" :  MyDateUtil.formatToString( "yyyy-MM-dd HH:mm:ss",listZXwxSchool.get ( i ).getExpireTime () )  );
            listSchoolNameModel.add ( schoolNameModel );
        }
        return listSchoolNameModel;
    }

    //删除学校
    @RequestMapping(value = "/deleteSchool",method = RequestMethod.POST)
    public Integer deleteSchool(@RequestBody Integer[] request)throws ServletException {
        Integer doState = 0;

        if (request.length != 0) {
            Collection listIds = new ArrayList();
            for (int i = 0; i < request.length; ++i) {
                listIds.add(request[i]);
            }

            doState = zxwxSchoolRepository.delZXwxSchoolByIds(listIds);
        }
        return doState;
    }

    //更新学校信息
    @RequestMapping(value = "/updateSchool",method =  RequestMethod.POST)
    public Integer updateSchool(@RequestBody SchoolNameModel request)throws ServletException {
        Integer doState = 0;
        if (request.getCharge () ==1) {
            doState = zxwxSchoolRepository.modifyById ( request.getName (), request.getAddress (), request.getCharge (), request.getChargeMoney (),MyDateUtil.stringToDate (request.getExpireTime (),"yyyy-MM-dd HH:mm:ss"), request.getId () );
        }else if(request.getCharge () == 0){

            doState = zxwxSchoolRepository.modifyByIds(request.getName (),request.getAddress (),request.getCharge (),request.getId ());
        }
        return doState ;
    }

    //获取所有科目信息
    @RequestMapping(value = "/getSubject",method = RequestMethod.GET)
    public List<SubjectModel> getSubject()throws ServletException {
        List<SubjectModel> listSubjectModel = new ArrayList<> ();

        List<ZXwxSubject>listZXwxSubject = zxwxSubjeckRepository.findAll ();
        for (int i = 0;i<listZXwxSubject.size ();++i){
            SubjectModel subjectModel = new SubjectModel();
            subjectModel.setSubjectName ( listZXwxSubject.get ( i ).getSubjectName () );
            listSubjectModel.add (subjectModel  );
        }
        return listSubjectModel;
    }

    //增加科目
    @RequestMapping(value = "/AddSubject",method = RequestMethod.POST)
    public Integer AddSubject (@RequestBody SubjectModel subjectModel)throws ServletException{
        Integer doState = 0;
        ZXwxSubject zXwxSubject = new ZXwxSubject();

        ZXwxSubject zXwxSubject1 = zxwxSubjeckRepository.findBySubjectName(subjectModel.getSubjectName ());
        if (zXwxSubject1 != null){
            doState = -1;
        }else {
            zXwxSubject.setSubjectName ( subjectModel.getSubjectName () );
            zxwxSubjeckRepository.save (zXwxSubject );
            doState = 1;
        }
        return doState;
    }

    //获取会员图片信息
    @RequestMapping(value = "/getImagePath",method = RequestMethod.GET)
    public  List<ZXwxVip> getImagePath()throws ServletException {
        List<ZXwxVip> listZXwxVip = zxwxVipRepository.findAll();

        return listZXwxVip;
    }
    // 更换vip图片
    @RequestMapping(value = "/updateVipPic", method = RequestMethod.POST)
    public Integer updateVipPic(@RequestBody VipModel request) throws ServletException {
        Integer doState = 0;

        // 得到原来的图片名称
        List<ZXwxVip> listZXwxVip = zxwxVipRepository.findAll();
        if (listZXwxVip.size() != 0) {
            // 删除原图片文件
            String path = "/opt/cxyd_static/" + listZXwxVip.get(0).getImagePath();
            BaseHelper.deleteFile(path);

            // 删除所有数据
            zxwxVipRepository.deleteAllInfo();
        }
        ZXwxVip zXwxVip = new ZXwxVip ();
        zXwxVip.setSchoolId ( 0 );
        zXwxVip.setImagePath(request.getName());
        zXwxVip = zxwxVipRepository.save ( zXwxVip );
        if (zXwxVip != null) {
            doState = 1;
        }
        return doState;
    }

    //获取会员日志信息
    @RequestMapping(value = "/getLogData",method = RequestMethod.GET)
    public List<TeacherModel> getLogData()throws ServletException{
        List<TeacherModel> listTeacherModel = new ArrayList<> ();
        List<ZXwxUser> listZXwxUser = new ArrayList<> ();
        List<ZXwxClass> listZXwxClass = new ArrayList<>();
        List<ZXwxClass> listZXwxClass2 = new ArrayList<>();
        List<ZXwxBind> listZXwxBind = new ArrayList<>();
        List<ZXwxSchool> listZXwxSchool = new ArrayList<>();
        List<ZXwxBindRole> listZXwxBindRole = new ArrayList<> ();
        String openId = "";
        listZXwxUser = zxwxUserRepository.findByRoleAndStatus("学生",1);
        for (int j = 0; j < listZXwxUser.size(); ++j) {
            TeacherModel teacherModel = new TeacherModel();
            teacherModel.setUserName (listZXwxUser.get ( j ).getUserName ());
            teacherModel.setUserId(listZXwxUser.get(j).getId());
            teacherModel.setSchoolId ( listZXwxUser.get ( j ).getSchoolId () );
            //根据SchoolId获取学校名称；
            listZXwxSchool = zxwxSchoolRepository.findById(listZXwxUser.get ( j ).getSchoolId () );
            for (int x = 0; x < listZXwxSchool.size(); ++x){
                teacherModel.setUserId ( listZXwxSchool.get ( x ).getId () );
                teacherModel.setSchoolName ( listZXwxSchool.get ( x ).getSchoolName () );
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
                } else {
                    openId = openId + "," + listZXwxBind.get(k).getOpenId();
                }

            }
            teacherModel.setOpenId ( openId );

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

            openId = "";
            List<ZXwxVipLog>listZXwxVipLog = zxwxVipLogRepository.findByAttach (String.valueOf(listZXwxUser.get(j).getId()));
            for (int i=0;i<listZXwxVipLog.size ();i++){
                teacherModel.setCreateTime ( MyDateUtil.formatToString ("yyyy-MM-dd HH:mm:ss",listZXwxVipLog.get ( i ).getCreateTime ()) );
                teacherModel.setTotalFee ( listZXwxVipLog.get ( i ).getTotalFee () );
                teacherModel.setState ( listZXwxVipLog.get ( i ).getState () );
            }
            listTeacherModel.add ( teacherModel );
        }

        return listTeacherModel;
    }

    //进行模糊查询会员日志信息
    @RequestMapping(value = "/getLogDataOnQuery",method = RequestMethod.POST)
    public List<TeacherModel> getLogData(@RequestBody TeacherModel request)throws ServletException{
        List<TeacherModel> listTeacherModel = new ArrayList<> ();
        List<ZXwxUser> listZXwxUser = new ArrayList<> ();
        List<ZXwxClass> listZXwxClass = new ArrayList<>();
        List<ZXwxClass> listZXwxClass2 = new ArrayList<>();
        List<ZXwxBind> listZXwxBind = new ArrayList<>();
        List<ZXwxSchool> listZXwxSchool = new ArrayList<>();
        List<ZXwxBindRole> listZXwxBindRole = new ArrayList<> ();
        String openId = "";
        listZXwxUser = zxwxUserRepository.findAll (MySpecification.getUsersWithSchoolIdForStudentS(request));
        for (int j = 0; j < listZXwxUser.size(); ++j) {
            TeacherModel teacherModel = new TeacherModel();
            teacherModel.setUserName (listZXwxUser.get ( j ).getUserName ());
            teacherModel.setUserId(listZXwxUser.get(j).getId());
            //根据SchoolId获取学校名称；
            listZXwxSchool = zxwxSchoolRepository.findById(listZXwxUser.get ( j ).getSchoolId () );
            for (int x = 0; x < listZXwxSchool.size(); ++x){
                teacherModel.setUserId ( listZXwxSchool.get ( x ).getId () );
                teacherModel.setSchoolName ( listZXwxSchool.get ( x ).getSchoolName () );
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
                } else {
                    openId = openId + "," + listZXwxBind.get(k).getOpenId();
                }

            }
            teacherModel.setOpenId ( openId );

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

            openId = "";
            List<ZXwxVipLog>listZXwxVipLog = zxwxVipLogRepository.findByAttach (String.valueOf(listZXwxUser.get(j).getId()));
            for (int i=0;i<listZXwxVipLog.size ();i++){
                teacherModel.setCreateTime ( MyDateUtil.formatToString ("yyyy-MM-dd HH:mm:ss",listZXwxVipLog.get ( i ).getCreateTime ()) );
                teacherModel.setTotalFee ( listZXwxVipLog.get ( i ).getTotalFee () );
                teacherModel.setState ( listZXwxVipLog.get ( i ).getState () );
            }
            listTeacherModel.add ( teacherModel );
        }

        return listTeacherModel;
    }

    //获取轮播图信息
    @RequestMapping(value = "/getImg",method = RequestMethod.GET)
    public List<ImgModel> getImg()throws ServletException{
        List<ImgModel> listImgModel = new ArrayList<> ();

        List<ZXwxImg> listZXwxImg = zxwxImgRepository.findAll ();
        for (int i = 0;i<listZXwxImg.size ();++i ){
            ImgModel imgModel = new ImgModel();
            imgModel.setId ( listZXwxImg.get ( i ).getId () );
            imgModel.setName ("http://www.cxyd.ltd:9202/file/showPicture?fileName="+ listZXwxImg.get ( i ).getSrcPath () );
            imgModel.setUrl ( listZXwxImg.get ( i ).getUrl () );
            listImgModel.add ( imgModel );
        }
        return listImgModel;
    }

    //删除轮播图的图片并保存新的图片
    @RequestMapping(value = "/DetImg", method = RequestMethod.POST)
    public Integer DetImg (@RequestBody ImgModel request) throws ServletException {
        Integer doState = 0;

        // 得到原来的图片名称
        List<ZXwxImg> listZXwxImg = zxwxImgRepository.findById(request.getId ());
        if (listZXwxImg.size() != 0) {
            // 删除原图片文件
            String path = "/opt/cxyd_static/" + listZXwxImg.get(0).getSrcPath ();
            BaseHelper.deleteFile(path);

            // 删除所选择数据
            zxwxImgRepository.deleteById(request.getId ());
        }
        ZXwxImg zXwxImg = new ZXwxImg ();
        zXwxImg.setSrcPath (request.getName());
        zXwxImg = zxwxImgRepository.save ( zXwxImg );
        if (zXwxImg != null) {
            doState = 1;
        }
        return doState;
    }
    //新增轮播图图片
    @RequestMapping(value = "/AddImg", method = RequestMethod.POST)
    public Integer AddImg(@RequestBody ImgModel request) throws ServletException {
        Integer doState = 0;

        ZXwxImg zXwxImg = new ZXwxImg ();
        zXwxImg.setSrcPath (request.getName());
        zXwxImg.setUrl ( "javascript:" );
        zXwxImg = zxwxImgRepository.save ( zXwxImg );
        if (zXwxImg != null) {
            doState = 1;
        }
        return doState;
    }

    //修改轮播图和连接地址
    @RequestMapping(value = "/modifyUrl",method = RequestMethod.POST)
    public Integer modifyUrl (@RequestBody ImgModel request )throws ServletException{
        Integer doState = 0;

        ZXwxImg zXwxImg = zxwxImgRepository.findFirstById (request.getId ()  );
        if (zXwxImg != null) {
            doState = zxwxImgRepository.modifyById ( request.getUrl (), request.getId () );
        }
        return doState;
    }

    //删除轮播图和连接地址；
    @RequestMapping(value = "/delImg",method = RequestMethod.POST)
    public  Integer delImg(@RequestBody Integer[] id ) throws ServletException{
        Integer doState = 0;

        for (int i = 0; i < id.length; ++i) {
            // 得到原来的图片名称
            List<ZXwxImg> listZXwxImg = zxwxImgRepository.findById(id[i]);
            if (listZXwxImg.size() != 0) {
                // 删除原图片文件
                String path = "/opt/cxyd_static/" + listZXwxImg.get(0).getSrcPath ();
                BaseHelper.deleteFile(path);

                // 删除所选择数据
                zxwxImgRepository.deleteById(id[i]);
            }
            doState = zxwxImgRepository.deleteById ( id[i] );
            if (doState == 0) {      // 表示更新失败
                break;
            }

        }
        return doState;
    }

    //统计首页总数
    @RequestMapping(value = "/countSystem",method = RequestMethod.GET)
    public IndexNunModel countSystem ()throws ServletException{
        IndexNunModel indexNunModel = new IndexNunModel();
            //学校总数
        indexNunModel.setSchoolTotal ( zxwxSchoolRepository.countByStatus (1) );
            //用户总数
        indexNunModel.setUserTotal ( zxwxUserRepository.countByStatus(1) );

        //绑定总数
        List<ZXwxUser> listZXwxUser = zxwxUserRepository.findByStatus ( 1 );
        if (listZXwxUser.size ()!=0){
            Collection listUserIds = new ArrayList();
            for (int i = 0; i < listZXwxUser.size(); ++i){
                listUserIds.add(listZXwxUser.get(i).getId());
            }
            indexNunModel.setBindTotal ( zxwxBindRepository.countByUserIdIn ( listUserIds ) );
        }
        //会员总数
        indexNunModel.setVipTotal ( zxwxUserRepository.countByVipStatus(1) );
//        List<ZXwxSchool> listZXwxSchool = zxwxSchoolRepository.findByStatus ( 1 );
//        if (listZXwxSchool.size ()!=0){
//            Collection listUserIds1 = new ArrayList();
//            for (int i = 0; i < listZXwxSchool.size(); ++i){
//                listUserIds1.add(listZXwxSchool.get(i).getId());
//            }
//            indexNunModel.setVipTotal ( zxwxVipRepository.countBySchoolIdIn (listUserIds1) );
//        }
        return indexNunModel;
    }
    @RequestMapping(value = "/getSysName",method = RequestMethod.POST)
    public List<SchoolNameModel> getSysName(@RequestBody SchoolNameModel request )throws ServletException{
        List<SchoolNameModel> listSchoolNameModel = new ArrayList<> ();
        List<ZXwxSysUser>listZXwxSysUser   = zxwxSysUserRepository.findAll (MySpecification.getAllSysName (request));
        for ( int i = 0; i<listZXwxSysUser.size ();++i){
            SchoolNameModel schoolNameModel = new SchoolNameModel();
            schoolNameModel.setSysName ( listZXwxSysUser.get ( i ).getSysName () );
            listSchoolNameModel.add ( schoolNameModel );
        }
        return listSchoolNameModel;
    }
}
