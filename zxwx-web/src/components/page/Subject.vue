<template>
  <div>
    <el-row class="subject">
      <el-col :span="3">
        <el-button round type="primary" icon="el-icon-circle-plus-outline" @click.native.prevent="dialogFormVisible = true;">添加科目</el-button>
      </el-col>
    </el-row>
    <el-row class="subjectTable">
      <el-col :span="24">
        <el-table :data="tableData" border style="width:18%;" height="395px">
          <el-table-column type="index"  width="77">
          </el-table-column>
          <el-table-column prop="subjectName" label="科目名称" width="130">
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <div>
      <el-dialog title="添加科目" :visible.sync="dialogFormVisible">
        <el-form :model="dialogForm" ref="dialogForm" :rules="rules">
          <el-form-item label="科目名称" prop="subjectName" :label-width="formLabelWidth">
            <el-input placeholder="请输入科目名称" v-model="dialogForm.subjectName" auto-complete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button type="primary" @click.native.prevent="OnSubmit">创 建</el-button>
          <el-button type="danger" @click="dialogFormVisible = false">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  import {Message} from 'element-ui'
  export default {
    data(){
      return{
        tableData:[],
        dialogForm:{
          subjectName:'',
        },
        dialogFormVisible:false,
        formLabelWidth: '120px',
        rules:{
          subjectName: [
            { required: true, message: '请输入科目名称', trigger: 'blur' }
          ],
        }
      }
    },
    mounted() {
      var that = this;
      that.getSubject();
    },
    methods:{
      getSubject(){
        var that = this;
        that.$axios({
          url: '/api/system/getSubject',
          method: 'get',
        }).then(res => {
          that.tableData = res.data
        }).catch()
      },
      OnSubmit() {
        var that = this;
        that.$refs.dialogForm.validate((valid) => {
          if (valid) {
            let data = {
              subjectName:that.dialogForm.subjectName,
            } ;
            that.$axios({
              url: '/api/system/AddSubject',
              method: 'post',
              data: data
            }).then(res => {
              if(res.data == 1){
                that.getSubject();
                that.$message({
                  message: "添加成功",
                  type: 'success'
                });
                that.dialogForm.subjectName = '';
                that.dialogFormVisible = false;
              }else if(res.data == -1){
                that.$message({
                  message: "该科目已存在",
                  type: 'error'
                });
              }
            }).catch()
          }
        });

      }
    }
  }
</script>
<style>
  .subject{
    margin-top: 15px;
    margin-left: 20px;
  }
  .subjectTable{
    margin-top: 30px;
    margin-left: 20px;
  }
</style>
