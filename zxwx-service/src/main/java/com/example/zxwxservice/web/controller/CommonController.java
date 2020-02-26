package com.example.zxwxservice.web.controller;

import com.example.zxwxservice.web.common.BaseHelper;
import com.example.zxwxservice.web.common.JwtHelper;
import com.example.zxwxservice.web.config.AudienceConfig;
import com.example.zxwxservice.web.entity.ZXwxSysUser;
import com.example.zxwxservice.web.model.AccessAuthorityResult;
import com.example.zxwxservice.web.model.LoginModel;
import com.example.zxwxservice.web.repository.ZxwxSysUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: lilun
 * @Date: 2019/3/23 16:00
 */
@CrossOrigin
@RestController
@RequestMapping("/common")
public class CommonController {
    @Autowired
    ZxwxSysUserRepository zxwxSysUserRepository;

    @Autowired
    private AudienceConfig audienceConfig;
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public AccessAuthorityResult login( @RequestBody LoginModel login)throws ServletException {
        AccessAuthorityResult result = new AccessAuthorityResult();
        result.setLogin(false);
        result.setMessage("账户/密码输入有误!");
        result.setValidate(false);
        String jwtToken = "";

        if (login.getLoginName() == null || login.getLoginPwd() == null) {
            //throw new ServletException("Please fill in username and password");
            result.setMessage("账户/密码输入有误!");
            return result;
        }

        String userId = login.getLoginName();
        String userPassword = login.getLoginPwd();

        ZXwxSysUser user = zxwxSysUserRepository.findBySysNameAndStatus(userId,1);
        if (user == null) {
            //throw new ServletException("User not found.");
            result.setMessage("账户不存在或已被删除!");
            return result;
        }
        String pwd = user.getPwd();
        String md5Pwd = BaseHelper.md5(userPassword).toLowerCase();
        if (!md5Pwd.equals(pwd.toLowerCase())) {
            //throw new ServletException("Invalid login. Please check your name and password.");
            result.setMessage("密码输入有误!");
            return result;
        }
        Map<String, Object> claims = new HashMap<> ();
        claims.put("schoolId", user.getSchoolId ());
        jwtToken = JwtHelper.createJWT(user.getId().toString(), audienceConfig.getIssuer(), userId, claims,
                audienceConfig.getExpiresSecond() * 1000);

        result.setLogin(true);
        result.setMessage("登录成功！");
        result.setSysFullName (user.getSysFullName ());
        result.setToken(jwtToken);
        result.setSysName(userId);
        result.setValidate(true);
        result.setSchoolId(user.getSchoolId());
        result.setUserId(user.getId());

        return result;
    }
}
