import axios from 'axios'
import Cookies from 'js-cookie'
import store from '../store/store'
import router from '../router'
const service = axios.create({
  //timeout: 5000                  // 请求超时时间
});
if (process.env.NODE_ENV === 'development') {
  axios.defaults.baseURL = 'http://127.0.0.1:9202';
}
if (process.env.NODE_ENV === 'production') {
  axios.defaults.baseURL = 'http://www.cxyd.ltd:9202';
}
service.interceptors.request.use(
  config => {
    if (Cookies.get('token')) {
      config.headers.Authorization = `Bearer ${Cookies.get('token')}`;
    }
    return config;
  },
err => {
  return Promise.reject(err);
});

export default service;
