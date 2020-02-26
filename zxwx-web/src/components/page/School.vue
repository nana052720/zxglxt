<template>
  <div>
    <el-row>
      <div class="school">
        <el-col :span="3">
            <el-button round type="primary" icon="el-icon-circle-plus-outline" @click.native.prevent="dialogFormVisible = true;">添加学校</el-button>
        </el-col>
        <el-col :span="3">
            <el-button round type="danger" icon="el-icon-circle-close-outline" @click.native.prevent="onDelete">删除学校</el-button>
        </el-col>
        <el-col :span="6">
            <el-input style="margin-left: 10px;" placeholder="请输入学校名称" v-model="schoolName" class="input-with-select" clearable></el-input>
        </el-col>
        <el-col :span="8">
            <el-button style="margin-left: 20px" type="primary" round icon="el-icon-search" @click.native.prevent="onQuery">查询</el-button>
        </el-col>
      </div>
    </el-row>
    <el-row>
      <el-col :span="24">
        <div class="schoolTable">
          <el-table @selection-change="handleSelectionChange" :data="tableData" border style="width:100%;" height="400">
            <el-table-column type="selection" width="37">
            </el-table-column>
            <el-table-column prop="name" label="学校名称" width="130">
            </el-table-column>
            <el-table-column prop="province" label="省" width="70">
            </el-table-column>
            <el-table-column prop="city" label="市" width="70">
            </el-table-column>
            <el-table-column prop="county" label="县" width="70">
            </el-table-column>
            <el-table-column prop="address" label="详细地址" width="260">
            </el-table-column>
            <el-table-column prop="chargeMoney" label="收费金额(元)" width="100">
            </el-table-column>
            <el-table-column prop="charge" label="是否收费" width="80">
              <template slot-scope="scope">
                {{scope.row.charge == 1 ? '是':'否'}}
              </template>
            </el-table-column>
            <el-table-column prop="expireTime" label="到期时间" width="140">
            </el-table-column>
            <el-table-column prop="createTime" label="创建时间" width="140">
            </el-table-column>
            <el-table-column label="操作" width="80">
            <template slot-scope="scope">
              <el-button type="primary" size="small" @click="handleEdit(scope.row)">修改</el-button>
            </template>
            </el-table-column>
          </el-table>
        </div>
      </el-col>
    </el-row>
    <!--修改界面-->
    <div>
      <el-dialog title="修改" :visible.sync="dialogFormEditVisible">
        <el-form :model="dialogFormEdit" ref="dialogFormEdit" :rules="rules">
          <el-form-item label="学校名称" prop="name" :label-width="formLabelWidth">
            <el-input  v-model="dialogFormEdit.schoolName" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="详细地址" prop="address" :label-width="formLabelWidth">
            <el-input  v-model="dialogFormEdit.address" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="是否收费" prop="charge" :label-width="formLabelWidth">
            <el-radio-group v-model="dialogFormEdit.charge" auto-complete="off">
              <el-radio
                :label="item.id"
                :key="item.id"
                v-for="item in charge" >
                {{item.name}}
              </el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="收费金额" prop="chargeMoney" :label-width="formLabelWidth">
            <el-input :disabled="dialogFormEdit.charge==0" v-model="dialogFormEdit.chargeMoney" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="到期时间" prop="expireTime" :label-width="formLabelWidth">
            <el-date-picker
              v-model="dialogFormEdit.expireTime"
              type="date"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择日期"
              :disabled="dialogFormEdit.charge==0">
            </el-date-picker>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button type="primary" @click.native.prevent="onEditClass">确 定</el-button>
          <el-button type="danger" @click="dialogFormEditVisible = false">取 消</el-button>
        </div>
      </el-dialog>
    </div>
    <!--添加学校界面-->
    <div>
      <el-dialog title="添加学校" :visible.sync="dialogFormVisible">
        <el-form :model="dialogForm" ref="dialogForm" :rules="rules">
          <el-form-item label="学校名称" prop="schoolName" :label-width="formLabelWidth">
            <el-input placeholder="请输入学校名称" v-model="dialogForm.schoolName" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="省市县" prop="selectedOptions" :label-width="formLabelWidth">
            <el-cascader
              placeholder="请选择地区"
              :options="addrOptions"
              v-model="dialogForm.selectedOptions"
              @change="handleChange"
              clearable>
            </el-cascader>
          </el-form-item>
          <el-form-item label="详细地址" prop="address" :label-width="formLabelWidth">
            <el-input placeholder="请输入详细地址" v-model="dialogForm.address" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="是否收费" prop="charge" :label-width="formLabelWidth">
            <el-radio-group v-model="dialogForm.charge" auto-complete="off">
              <el-radio
                :label="item.id"
                :key="item.id"
                :value="item.id"
                v-for="item in charge" >
                {{item.name}}
              </el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="收费金额(元)" prop="chargeMoney" :label-width="formLabelWidth">
            <el-input :disabled="dialogForm.charge == 0" placeholder="请输入收费金额(元)" v-model="dialogForm.chargeMoney" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="到期时间" prop="expireTime" :label-width="formLabelWidth">
            <el-date-picker
              v-model="dialogForm.expireTime"
              type="date"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="选择日期"
              :disabled="dialogForm.charge == 0">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="老师绑定密码" prop="bindPwd" :label-width="formLabelWidth">
            <el-input placeholder="请输入理员登陆密码" type="password" v-model="dialogForm.bindPwd" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="管理员登陆名" prop="sysName" :label-width="formLabelWidth">
            <el-input placeholder="请创建学校管理员登陆名" v-model="dialogForm.sysName" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="pwd" :label-width="formLabelWidth">
            <el-input placeholder="请输入理员登陆密码" type="password" v-model="dialogForm.pwd" auto-complete="off"></el-input>
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
  import myAddressData from "../china_address_v4.json"
  import {Message} from 'element-ui'
  import Cookies from 'js-cookie'
  export default {
    data(){
      return{
        addrOptions: myAddressData,
        dialogForm:{
          selectedOptions: [],
          schoolName:'',
          address:'',
          charge:0,
          chargeMoney:'',
          expireTime:'',
          sysName:'',
          pwd:'',
          bindPwd:'',
        },
        dialogFormVisible:false,
        dialogFormEditVisible: false,
        formLabelWidth: '120px',
        tableData: [],
        dialogFormEdit:{
          selectedOptions: [],
          id:0,
          schoolName:'',
          address:'',
          charge:0,
          chargeMoney:'',
          expireTime:'',
          createTime:'',
        },
        charge:[
          { name: "是", id:1},
          { name: "否", id:0 }
        ],
        multipleSelection: [],
        schoolName:'',
        rules:{
          schoolName: [
            { required: true, message: '请输入学校名称', trigger: 'blur' }
          ],
          selectedOptions:[
            { required: true, message: '请选择地区', trigger: 'blur' }
          ],
          address:[
            { required: true, message: '请输入详细地址', trigger: 'blur' }
          ],
          sysName:[
            { required: true, message: '请输入管理员登陆名', trigger: 'blur' }
          ],
          pwd:[
            { required: true, message: '请输入密码', trigger: 'blur' }
          ],
          bindPwd:[
            { required: true, message: '请输入老师绑定密码', trigger: 'blur' }
          ],
        }
      }
    },
    mounted() {
      var that = this;
      that.onQuery();
    },
    methods: {
      onEditClass(){
        var that = this;
        that.$refs.dialogFormEdit.validate((valid) => {
          if (valid) {
            let data = {
              id:that.id,
              name:that.dialogFormEdit.schoolName,
              address:that.dialogFormEdit.address,
              charge:that.dialogFormEdit.charge,
              chargeMoney:that.dialogFormEdit.chargeMoney,
              expireTime:that.dialogFormEdit.expireTime,
            };
            that.$axios({
              url: '/api/system/updateSchool',
              method: 'post',
              data: data
            }).then(res => {
              //清空
              if (res.data>=1) {
                that.dialogFormEdit.schoolName = '';
                that.dialogFormEdit.address = '';
                that.dialogFormEdit.charge = '';
                that.dialogFormEdit.chargeMoney = '';
                that.dialogFormEdit.expireTime = '';
                // 重新获取新的数据
                that.onQuery();
                that.dialogFormEditVisible = false;

                that.$message({
                  message: "更新成功!",
                  type: 'success'
                })
              } else {
                that.$message({
                  message: "更新失败!",
                  type: 'error'
                });
              }
          }).catch()
        } else {
            return false;
          }

        });
      },
      handleEdit(row) {
        var that = this;
        that.dialogFormEditVisible = true;
        that.id = row.id;
        that.dialogFormEdit.createTime = row.createTime;
        that.dialogFormEdit.selectedOptions[0] = row.province;
        that.dialogFormEdit.selectedOptions[1] = row.city;
        that.dialogFormEdit.selectedOptions[2] = row.county;
        that.dialogFormEdit.schoolName = row.name;
        that.dialogFormEdit.address = row.address;
        that.dialogFormEdit.charge = row.charge;
        that.dialogFormEdit.chargeMoney = row.chargeMoney;
        that.dialogFormEdit.expireTime = row.expireTime;
      },
      handleSelectionChange(val) {
        var that = this;
        that.multipleSelection = val;
      },
      onDelete() {
        var that = this;
        var arrId = new Array();
        if (that.multipleSelection.length == 0) {
          that.$message({
            type: 'warning',
            message: '没有选择任何内容!'
          });
          return;
        }
        for (var i = 0; i < that.multipleSelection.length; ++i) {
          arrId.push(that.multipleSelection[i].id);
        }
        that.$axios({
          url: '/api/system/deleteSchool',
          method: 'post',
          data: arrId
        }).then(res => {
          if (res.data != 0) {
            that.$message({
              message: "删除成功",
              type: 'success'
            });
            that.onQuery();
          } else {
            that.$message({
              message: "删除失败!",
              type: 'error'
            });
          }
        }).catch()
      },
      OnSubmit() {
        var that = this;
        that.$refs.dialogForm.validate((valid) => {
          if (valid) {
            // 根据省市县获取相关代理信息
            let data = {
              province: that.dialogForm.selectedOptions[0],
              city: that.dialogForm.selectedOptions[1],
              county: that.dialogForm.selectedOptions[2],
              name: that.dialogForm.schoolName,
              charge: that.dialogForm.charge,
              chargeMoney:that.dialogForm.chargeMoney,
              expireTime: that.dialogForm.expireTime,
              sysName: that.dialogForm.sysName,
              address: that.dialogForm.address,
              pwd: that.dialogForm.pwd,
              bindPwd:that.dialogForm.bindPwd,
            };

            that.$axios({
              url: '/api/system/addOneSchoolWithSysUser',
              method: 'post',
              data: data
            }).then(res => {
              if (res.data == 1) {
                that.onQuery();
                that.$message({
                  message: "添加成功",
                  type: 'success'
                });
                // 清空
                that.dialogForm.selectedOptions = [];
                that.dialogForm.schoolName = '';
                that.dialogForm.sysName = '';
                that.dialogForm.pwd = '';
                that.dialogForm.charge = '';
                that.dialogForm.address = '';
                that.dialogForm.expireTime = '';
                that.dialogForm.chargeMoney='';
                that.dialogForm.bindPwd='';
                that.dialogFormVisible = false;
              } else if (res.data == -1){
                that.$message({
                  message: "该管理员登录名已存在",
                  type: 'error'
                });
              }
            }).catch()

          } else {
            return false;
          }
        });
      },
      onQuery() {
        var that = this;
        var data = {
          name: ''
        };
        if (that.schoolName !== "") {
          data.name = that.schoolName;
        }
        that.$axios({
          url: '/api/system/getSchool',
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
  .school{
    margin-top: 10px;
  }
  .schoolTable{
    margin-top: 20px;
  }
</style>
