<template>
  <div>
    <el-row class="Log1">
      <el-col :span="6">
        <el-input style="margin-left: 10px;" placeholder="请输入学校名称" v-model="userName" class="input-with-select" clearable></el-input>
      </el-col>
      <el-col :span="3">
        <el-button style="margin-left: 20px" type="primary" round icon="el-icon-search" @click.native.prevent="onQuery">查询</el-button>
      </el-col>
    </el-row>
    <el-row class="Log">
      <el-col :span="24">
        <el-table :data="tableData" border style="width:100%;" height="400">
          <el-table-column type="index"  width="60">
          </el-table-column>
          <el-table-column prop="userName" label="学生名称" width="150">
          </el-table-column>
          <el-table-column prop="classInfo" label="班级" width="200">
          </el-table-column>
          <el-table-column prop="schoolName" label="学校" width="150">
          </el-table-column>
          <!--<el-table-column prop="name" label="支付类别" width="150">-->
          <!--</el-table-column>-->
          <el-table-column prop="totalFee" label="支付金额(元)" width="150">
          </el-table-column>
          <el-table-column prop="state" label="状态" width="150">
          </el-table-column>
          <el-table-column prop="createTime" label="操作时间" width="166">
        </el-table-column>
        </el-table>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  import myAddressData from "../china_address_v4.json"
  import {Message} from 'element-ui'
  import Cookies from 'js-cookie'
  import ElRow from "element-ui/packages/row/src/row";
  import ElCol from "element-ui/packages/col/src/col";
  export default {
    components: {
      ElCol,
      ElRow},
    data(){
      return{
        tableData:[],
        userName:''
      }
    },
    mounted() {
      var that = this;
      that.getLogData();
    },
    methods:{
      getLogData(){
        var that = this;
        that.$axios({
          url:'/api/system/getLogData',
          method:'get',
        }).then(res =>{
          that .tableData = res.data
        }).catch()
      },
      onQuery(){
        var that = this;
        var data = {
          userName: '',
          role: '学生',
        };
        if (that.userName !== "") {
          data.userName = that.userName;
        }
        that.$axios({
          url: '/api/system/getLogDataOnQuery',
          method: 'post',
          data: data
        }).then(res => {
          that.tableData = res.data;
        }).catch()
      }
    }
  }
</script>
<style>
  .Log{
    margin-top: 30px;
  }
 .Log1{
    margin-top: 15px;
   margin-left: 10px;
  }
</style>
