<template>
  <div class="header">
    <!-- 折叠按钮 -->
    <div class="collapse-btn" @click="collapseChage">
      <i class="el-icon-menu"></i>
    </div>
    <div class="logo">智校后台管理系统</div>
    <div class="header-right">
      <div class="header-user-con">
        <!-- 全屏显示 -->
        <div class="btn-fullscreen" @click="handleFullScreen">
          <el-tooltip effect="dark" :content="fullscreen?`取消全屏`:`全屏`" placement="bottom">
            <i class="el-icon-rank"></i>
          </el-tooltip>
        </div>
        <!-- 消息中心 -->
        <!--<div class="btn-bell">-->
          <!--<el-tooltip effect="dark" :content="message?`有${message}条未读消息`:`消息中心`" placement="bottom">-->
            <!--<router-link to="/tabs">-->
              <!--<i class="el-icon-bell"></i>-->
            <!--</router-link>-->
          <!--</el-tooltip>-->
          <!--<span class="btn-bell-badge" v-if="message"></span>-->
        <!--</div>-->
        <!-- 用户头像 -->
        <div class="user-avator"><img src="../../assets/img/img.jpg"></div>
        <!-- 用户名下拉菜单 -->
        <el-dropdown class="user-name" trigger="click">
                    <span class="el-dropdown-link">
                        {{username}} <i class="el-icon-caret-bottom"></i>
                    </span>
          <el-dropdown-menu slot="dropdown">
            <!--<a href="#" target="_blank">-->
              <!--<el-dropdown-item>关于作者</el-dropdown-item>-->
            <!--</a>-->
            <!--<a href="#" target="_blank">-->
              <!--<el-dropdown-item>项目仓库</el-dropdown-item>-->
            <!--</a>-->
            <el-dropdown-item  @click.native.prevent="dialogFormVisible = true;">修改密码</el-dropdown-item>
            <el-dropdown-item divided  @click.native="logout1">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </div>
    <div>
      <el-dialog title="修改密码" :visible.sync="dialogFormVisible">
        <el-form :model="dialogForm" ref="dialogForm" :rules="rules2">
          <el-form-item label="旧密码:" prop="oldPass" :label-width="formLabelWidth">
            <el-input type="password" v-model="dialogForm.oldPass" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="新密码:" prop="pass" :label-width="formLabelWidth">
            <el-input type="password" v-model="dialogForm.pass" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="确认密码:" prop="checkPass" :label-width="formLabelWidth">
            <el-input type="password" v-model="dialogForm.checkPass" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item>
            <el-button  style="margin-left: 500px" type="primary" @click="submitForm('dialogForm')">修改</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  import { mapState, mapMutations, mapActions } from 'vuex'
  import Cookies from 'js-cookie'
  import bus from '../common/bus';
  export default {
    data() {
      var checkPass = (rule, value, callback) => {
        if (!value) {
          return callback(new Error('密码不能为空'));
        }
        else {
          if (this.dialogForm.oldPass == '') {
            this.$refs.dialogForm.validateField('oldPass');
          }
          callback();
        }
      };
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入新密码'));
        } else {
          if (this.dialogForm.pass !== '') {
            this.$refs.dialogForm.validateField('checkPass');
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入新密码'));
        } else if (value !== this.dialogForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };

      return {
        formLabelWidth: '120px',
        dialogFormVisible:false,
        rules2: {
          oldPass: [
            { validator: checkPass, trigger: 'blur' }
          ],
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ]
        },
        collapse: false,
        fullscreen: false,
        username: '',
        message: 2,
        dialogForm: {
          pass: '',
          checkPass: '',
          oldPass: ''
        },
      }
    },
    computed:{
//      username(){
//        let username = localStorage.getItem('ms_username');
//        return username ? username : this.name;
//      }
    },
    methods:{
      submitForm(){
        var that = this;
        that.$refs.dialogForm.validate((valid) => {
          if (valid) {
            let pwd = [];
            pwd.push(that.dialogForm.oldPass);
            pwd.push(that.dialogForm.pass);
            pwd.push(Cookies.get('id'));
            that.$axios({
              url: '/api/school/changeUserPwd',
              method: 'post',
              data: pwd
            }).then(res =>{
              if (res.data == 0){
                that.$message({
                  message: "参数个数不正确！",
                  type: 'error'
                });
                return false;
              } else if (res.data == 2){
                that.$message({
                  message: "旧密码错误！",
                  type: 'error'
                });
                return false;
              } else {
                that.$message({
                  message: "修改密码成功！",
                  type: 'success'
                });
              }
              this.dialogFormVisible = false;
              this.$refs.dialogForm.resetFields();
            }).catch()
          }
        })
      },
      ...mapActions({
        logout: 'logout'
      }),
      // 用户名下拉菜单选择事件
      logout1: function () {
        var _this = this;
        this.$confirm('确认退出吗?', '提示', {
          type: 'warning'
        }).then(() => {
            this.logout().then(res => {
              this.$router.push({path: '/'});
            })
        }).catch(() => {
        });
      },
      // 侧边栏折叠
      collapseChage(){
        this.collapse = !this.collapse;
        bus.$emit('collapse', this.collapse);
      },
      // 全屏事件
      handleFullScreen(){
        let element = document.documentElement;
        if (this.fullscreen) {
          if (document.exitFullscreen) {
            document.exitFullscreen();
          } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
          } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
          } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
          }
        } else {
          if (element.requestFullscreen) {
            element.requestFullscreen();
          } else if (element.webkitRequestFullScreen) {
            element.webkitRequestFullScreen();
          } else if (element.mozRequestFullScreen) {
            element.mozRequestFullScreen();
          } else if (element.msRequestFullscreen) {
            // IE11
            element.msRequestFullscreen();
          }
        }
        this.fullscreen = !this.fullscreen;
      }
    },
    mounted(){
      if(document.body.clientWidth < 1500){
        this.collapseChage();
        var _this = this;
        _this.username = Cookies.get('sysFullName');
        console.log(_this.username);
      }
    }
  }
</script>
<style scoped>
  .header {
    position: relative;
    box-sizing: border-box;
    width: 100%;
    height: 70px;
    font-size: 22px;
    color: #fff;
  }
  .collapse-btn{
    float: left;
    padding: 0 21px;
    cursor: pointer;
    line-height: 70px;
  }
  .header .logo{
    float: left;
    width:250px;
    line-height: 70px;
  }
  .header-right{
    float: right;
    padding-right: 50px;
  }
  .header-user-con{
    display: flex;
    height: 70px;
    align-items: center;
  }
  .btn-fullscreen{
    transform: rotate(45deg);
    margin-right: 5px;
    font-size: 24px;
  }
  .btn-bell, .btn-fullscreen{
    position: relative;
    width: 30px;
    height: 30px;
    text-align: center;
    border-radius: 15px;
    cursor: pointer;
  }
  .btn-bell-badge{
    position: absolute;
    right: 0;
    top: -2px;
    width: 8px;
    height: 8px;
    border-radius: 4px;
    background: #f56c6c;
    color: #fff;
  }
  .btn-bell .el-icon-bell{
    color: #fff;
  }
  .user-name{
    margin-left: 10px;
  }
  .user-avator{
    margin-left: 20px;
  }
  .user-avator img{
    display: block;
    width:40px;
    height:40px;
    border-radius: 50%;
  }
  .el-dropdown-link{
    color: #fff;
    cursor: pointer;
  }
  .el-dropdown-menu__item{
    text-align: center;
  }
</style>
