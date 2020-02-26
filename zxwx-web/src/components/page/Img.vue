<template>
  <div>
    <el-row>
      <el-col :span="3">
        <el-upload
          class="avatar-uploader"
          action="http://www.cxyd.ltd:9202/file/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload"
          list-type="picture">
          <el-button style="margin-left: 20px;margin-top:15px" round size="big" type="primary">添加图片</el-button>
        </el-upload>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="24">
        <el-table  :data="tableData" border style=" margin-top:30px;width:100%;" height="400">
          <el-table-column type="selection" width="37">
          </el-table-column>
          <el-table-column  prop="name" label="图片" width="390">
            <template slot-scope="scope">
              <img :src="scope.row.name"  min-width="210" height="190" />
            </template>
          </el-table-column>
          <el-table-column prop="url" label="跳转地址" width="370">
          </el-table-column>
          <el-table-column label="操作" width="180">
            <template slot-scope="scope">
              <el-button type="danger" size="small" @click="handleDel(scope.row)">删除</el-button>
              <el-button type="primary" size="small" @click="handleEdit(scope.row)">修改</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>
    <!--修改界面-->
    <div>
      <el-dialog title="修改" :visible.sync="dialogFormEditVisible">
        <el-form :model="dialogFormEdit" ref="dialogFormEdit" :rules="rules">
          <el-form-item label="跳转地址" prop="url" :label-width="formLabelWidth">
            <el-input  v-model="dialogFormEdit.url" auto-complete="off"></el-input>
          </el-form-item>
          <el-form-item label="产品图片" prop="name" :label-width="formLabelWidth">
            <el-upload
              class="avatar-uploader"
              action="http://www.cxyd.ltd:9202/file/upload"
              :show-file-list="false"
              :on-success="handleAvatarSuccessImg"
              :before-upload="beforeAvatarUploadImg">
              <img :src="dialogFormEdit.name" min-width="100" height="150" list-type="picture-card" alt="" title="点击图片更换" />
              <i class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
        </el-form>
        <div slot="footer">
          <el-button type="primary" @click.native.prevent="onEditVip">确 定</el-button>
          <el-button type="danger" @click="dialogFormEditVisible = false">取 消</el-button>
        </div>
      </el-dialog>
    </div>
  </div>
</template>
<script>
  import { Message } from 'element-ui';
  import ElRow from "element-ui/packages/row/src/row";
  import ElCol from "element-ui/packages/col/src/col";
  export default {
    components: {
      ElCol,
      ElRow},
    data(){
      return{
        tableData:[],
        dialogFormEdit:{
          url:'',
        },
        formLabelWidth: '120px',
        dialogFormEditVisible: false,
        rules:{
          url: [
            { required: true, message: '请输入跳转地址', trigger: 'blur' }
          ],
        }
      }
    },
    mounted() {
      var that = this;
      that.getImg();
    },
    methods:{
      handleEdit(row) {
        var that = this;
        that.dialogFormEditVisible = true;
        that.id = row.id;
        that.dialogFormEdit.url = row.url;
        that.dialogFormEdit.name = row.name;
      },
      handleAvatarSuccess(res, file) {
        var that = this;
        that.imageUrl = URL.createObjectURL(file.raw); // 这个是显示本地选择的文件，不是服务器的
//        that.imageUrl = that.$store.state.showPicAddrBase + res;
        if (res != "") {
          that.replaceImg(res);
        }

      },
      beforeAvatarUpload(file) {
        //const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

//        if (!isJPG) {
//          this.$message.error('上传头像图片只能是 JPG 格式!');
//        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isLt2M;
      },
      handleAvatarSuccessImg(res, file) {
        var that = this;
        that.imageUrl = URL.createObjectURL(file.raw); // 这个是显示本地选择的文件，不是服务器的
//        that.imageUrl = that.$store.state.showPicAddrBase + res;
        if (res != "") {
          that.ReplacePictures(res);
        }

      },
      beforeAvatarUploadImg(file) {
        //const isJPG = file.type === 'image/jpeg';
        const isLt2M = file.size / 1024 / 1024 < 2;

//        if (!isJPG) {
//          this.$message.error('上传头像图片只能是 JPG 格式!');
//        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!');
        }
        return isLt2M;
      },
      ReplacePictures(fileName){
        var that = this;
        let data = {
          id:that.id,
          name: fileName
        };

        that.$axios({
          url:'/api/system/DetImg',
          method:'post',
          data: data
        }).then(res=>{
          if (res.data > 0) {
            that.getImg();
            that.$message({
              message: "更换成功",
              type: 'success'
            });
          }else {
            that.$message({
              message: "更换失败",
              type: 'success'
            });
          }
        }).catch();
      },
      replaceImg(fileName){
        var that = this;
        let data = {
          id:that.id,
          name: fileName
        };
        that.$axios({
          url:'/api/system/AddImg',
          method:'post',
          data: data
        }).then(res=>{
          if (res.data > 0) {
            that.getImg();
            that.$message({
              message: "上传成功",
              type: 'success'
            });
          }else {
            that.$message({
              message: "上传失败",
              type: 'success'
            });
          }
        }).catch();
      },
      getImg(){
        var that = this
        that.$axios({
          url:'/api/system/getImg',
          method:'get',
        }).then(res =>{
          that.tableData = res.data;
          that.images = res.data;
        }).catch()
      },
      onEditVip(){
        var that = this;
        that.$refs.dialogFormEdit.validate((valid) => {
          if (valid) {
            this.$confirm('确认要修改吗？', '温馨提示!', {}).then(() => {
              let data = {
                id:that.id,
                url:that.dialogFormEdit.url,
              };
              this.$axios({
                url:'/api/system/modifyUrl',
                method:'post',
                data:data
              }).then(res=>{
                if (res.data ==1){
                  let data = {
                    id: this.id,
                  };
                  that.getImg();
                  Message({
                    message: "更新成功！",
                    type: 'success',
                    center: true
                  });
                }else {
                  Message({
                    message: "数据更新失败！",
                    type: 'error',
                    center: true
                  });
                }
                that.dialogFormEditVisible = false;
              }).catch()
            })
          }
        });
      },
      handleDel(row){
        var that = this;
        that.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() =>{
          let data = []
          data.push(row.id);
          that.$axios({
            url: '/api/system/delImg',
            method: 'post',
            data: data
          }).then(res => {
            if (res.data == 0) {
              that.getImg();

              that.$message({
                type: 'success',
                message: '删除成功!'
              });
            } else {
              that.$message({
                type: 'error',
                message: '删除失败!'
              });
            }
          }).catch()
        }).catch(() => {
        });
      }
    }
  }
</script>
<style>

</style>
