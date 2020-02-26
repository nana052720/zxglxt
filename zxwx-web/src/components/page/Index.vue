<template>
  <div>
    <el-row>
      <el-col :span="7">
        <el-card class="box-card">
          <div>
            <p style="color: #ad4e2d">学校总数</p>
            <p style="color: rgba(255,83,93,1);font-size: 25px;margin-top: 10px">{{ schoolTotal }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="7">
        <el-card class="box-card1" >
          <div>
            <p style="color: #ad4e2d">用户总数</p>
            <p style="color: rgba(255,83,93,1);font-size: 25px;margin-top: 10px">{{ userTotal }}</p>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="7">
        <el-card class="box-card">
          <div>
            <p style="color: #ad4e2d">绑定总数</p>
            <p style="color: rgba(255,83,93,1);font-size: 25px;margin-top: 10px">{{ bindTotal }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="7">
        <el-card class="box-card1" >
          <div>
            <p style="color: #ad4e2d">会员总数</p>
            <p style="color: rgba(255,83,93,1);font-size: 25px;margin-top: 10px">{{ vipTotal }}</p>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  import Cookies from 'js-cookie'
export default {
  data(){
    return{
      schoolTotal:0,
      userTotal:0,
      bindTotal:0,
      vipTotal:0
    }
  },
  mounted() {
    var that = this;
    that.getCountSystem();
  },
    methods:{
      getCountSystem(){
        var that = this;
        that.$axios({
          url:'/api/system/countSystem',
          method:'get',
        }).then(res =>{
          that.schoolTotal = res.data.schoolTotal;
          that.userTotal = res.data.userTotal;
          that.bindTotal = res.data.bindTotal;
          that.vipTotal = res.data.vipTotal;
        }).catch()
      },
    }
  }
</script>
<style>
  .box-card {
    width: 300px;
    height: 150px;
    margin-top: 50px;
    text-align: center;
    margin-left: 200px;
  }
  .box-card1{
    width: 300px;
    height: 150px;
    margin-top: 50px;
    text-align: center;
    margin-left: 300px;
  }
</style>
