import Vue from "vue"
import Vuex from "vuex"
import axios from '../util/ajax'
import Cookies from 'js-cookie'

Vue.use(Vuex);
const state = {
  id:0,
  sysFullName:'',
  schoolId:0,
  token:'',
  sysName:'',
};

const getters = {};

const mutations = {
  setSysFullName: (state, data) => {
    if(data){
      Cookies.set('sysFullName', data)
    } else {
      Cookies.remove('sysFullName')
    }
    state.sysFullName = data
  },
  setId: (state, data) => {
    if(data){
      Cookies.set('id', data)
    } else {
      Cookies.remove('id')
    }
    state.id = data
  },
  setSchoolId: (state, data) => {
    if(data){
      Cookies.set('schoolId', data)
    } else {
      Cookies.remove('schoolId')
    }
    state.schoolId = data
  },
  setToken: (state, data) => {
    if(data){
      Cookies.set('token', data)
    } else {
      Cookies.remove('token')
    }
    state.token = data
  },
  setSysName: (state, data) => {
    if(data){
      Cookies.set('sysName', data)
    } else {
      Cookies.remove('sysName')
    }
    state.sysName = data
  },
};
const actions = {
  logout({commit}, data) {
    return new Promise((resolve) => {
      commit('setSysName', '');
      commit('setId', '');
      commit('setToken', '');
      commit('setSchoolId', '');
      commit('setSysFullName', '');
      resolve();
    })
  },
  loginByUserId({ commit }, userInfo){
    return new Promise((resolve, reject) => {
      axios({
        url: '/common/login',
        method: 'post',
        data: {
          ...userInfo
        }
      }).then(res => {
        console.log(res);
        if(res.data.login == true){
          commit('setSysName', res.data.sysName);// 如果登陆成功，就调用setName函数更新仓库的name变量
          commit('setId', res.data.userId);
          commit('setToken', res.data.token);
          commit('setSchoolId', res.data.schoolId);
          commit('setSysFullName', res.data.sysFullName);
        } else{
          console.log(res.data.message);
        }

        resolve(res);
      }).catch(err => {
        if(typeof err.data === "undefined"){
          reject("请求失败!");
        } else {
          reject(err.data.message);
        }
      })
    });
  },
  // 重新登录
  // relogin({commit}){
  //   return new Promise((resolve) => {
  //     // TODO 问题严重，重新登录需要字段不明，但肯定不能保存token
  //     commit('setSysName', decodeURIComponent(Cookies.get('sysName')));
  //     commit('setId', Cookies.get('id'));
  //     commit('setToken', Cookies.get('token'));
  //     commit('setSchoolId', Cookies.get('schoolId'));
  //     commit('setSysFullName', Cookies.get('sysFullName'));
  //     resolve()
  //   })
  // },
};
export default  new Vuex.Store({
  state,
  getters,
  mutations,
  actions,
})
