<template>
  <div class="vip">
    <el-row >
      <el-col :span="24">
        <el-upload
          class="avatar-uploader"
          action="http://www.cxyd.ltd:9202/file/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :before-upload="beforeAvatarUpload">
          <i class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="24">
        <div style="margin-top: 20px">
          <h5>已传图展示</h5>
          <img v-show="imageUrl" :src="imageUrl" width="450" height="300" style="margin-top: 5px;"/>
        </div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        uploadFileAddr: '',
        imageUrl: '',
        imageParh:'http://www.cxyd.ltd:9202/file/showPicture?fileName='
      };
    },
    mounted() {
      var that = this;
      that.getVip();
    },
    methods: {
      handleAvatarSuccess(res, file) {
        var that = this;
        that.imageUrl = URL.createObjectURL(file.raw); // 这个是显示本地选择的文件，不是服务器的
//        that.imageUrl = that.$store.state.showPicAddrBase + res;
        if (res != "") {
          that.submitUpload(res);
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
      submitUpload(fileName){
        var that = this;
        let data = {
          name: fileName
        };

        that.$axios({
          url:'/api/system/updateVipPic',
          method:'post',
          data: data
        }).then(res=>{
          if (res.data > 0) {
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
      getVip(){
        var that = this
        that.$axios({
          url:'/api/system/getImagePath',
          method:'get',
        }).then(res =>{
          if (res.data.length != 0) {
            that.imageUrl = that.imageParh + res.data[0].imagePath;
          }
        }).catch()
      },
    }
  }
</script>
<style>
  .vip{
    margin-left: 30px;
    margin-top: 30px;
  }
</style>
