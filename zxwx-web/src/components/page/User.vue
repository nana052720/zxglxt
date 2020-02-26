<template>
  <div>
    <el-row style="margin-left: 20px">
      <el-col :span="6">
        <el-input style="margin-left: 10px;" placeholder="请输入登陆名称" v-model="sysName" class="input-with-select" clearable></el-input>
      </el-col>
      <el-col :span="8">
        <el-button style="margin-left: 20px" type="primary" round icon="el-icon-search" @click.native.prevent="onQuery">查询</el-button>
      </el-col>
    </el-row>
    <el-row style="margin-top: 30px">
      <el-col :span="24">
        <el-table :data="tableData" border style="width:18%; margin-left: 30px" height="395px">
          <el-table-column type="index"  width="77">
          </el-table-column>
          <el-table-column prop="sysName" label="登陆名称" width="130">
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        tableData:[],
        sysName:''
      }
    },
    mounted() {
      var that = this;
      that.onQuery();
    },
    methods:{
      onQuery(){
        var that = this;
        let data = {
          sysName:''
        };
        if (that.sysName !== "") {
          data.sysName = that.sysName;
        }
        that.$axios({
          url: '/api/system/getSysName',
          method: 'post',
          data:data
        }).then(res => {
          that.tableData = res.data
        }).catch()
      }
    }
  }
</script>
