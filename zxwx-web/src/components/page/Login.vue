<template>
  <div class="login-wrap">
    <div class="ms-login">
      <div class="ms-title">智校后台管理系统登陆</div>
      <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="0px" class="ms-content">
        <el-form-item prop="username">
          <el-input v-model="ruleForm.username" placeholder="请输入用户名">
            <el-button slot="prepend" icon="el-icon-lx-people"></el-button>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" placeholder="请输入密码" v-model="ruleForm.password" @keyup.enter.native="submitForm()">
            <el-button slot="prepend" icon="el-icon-lx-lock"></el-button>
          </el-input>
        </el-form-item>
        <div class="login-btn">
          <el-button type="primary"  native-type="                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   " @click.native.prevent="submitForm('ruleForm')">登录</el-button>
          <el-alert v-if="message"title="" type="error" :closable="false">{{message}}</el-alert>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
  import { Message } from 'element-ui';
  import { mapState, mapMutations, mapActions } from 'vuex'
  export default {
    data: function(){
      return {
        message:'',
        ruleForm: {
          username: 'll',
          password: '123456'
        },
        rules: {
          username: [
            { required: true, message: '请输入用户名', trigger: 'blur' }
          ],
          password: [
            { required: true, message: '请输入密码', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      ...mapActions({
        login: 'loginByUserId'
      }),
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            let data ={
              loginName:this.ruleForm.username,
              loginPwd:this.ruleForm.password
            };
            this.login(data).then(res => {
              if(res.data.login){
                this.$router.push({path: '/Index'});
              } else{
                this.message = res.data.message;
              }
            }).catch(err => {
              //this.message = err.response.data;
            })
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      }
    }
  }
</script>

<style scoped>
  .login-wrap{
    position: relative;
    width:100%;
    height:100%;
    background-image: url(../../assets/img/login-bg.jpg);
    background-size: 100%;
  }
  .ms-title{
    width:100%;
    line-height:50px;
    text-align:center;
    font-size:20px;
    color: rgba(0, 0, 0, 0.19);
    border-bottom: 1px solid #ddd;
  }
  .ms-login{
    position: absolute;
    left:50%;
    top:50%;
    width:350px;
    margin:-190px 0 0 -175px;
    border-radius: 5px;
    background: rgba(255,255,255, 0.3);
    overflow: hidden;
  }
  .ms-content{
    padding: 30px 30px;
  }
  .login-btn{
    text-align: center;
  }
  .login-btn button{
       width:100%;
       height:36px;
       margin-bottom: 10px;
  }
  .login-tips{
    font-size:12px;
    line-height:30px;
    color:#fff;
  }
</style>
