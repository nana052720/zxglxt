// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './assets/css/icon.css';
import axios from './util/ajax'
import "babel-polyfill";
import Cookies from 'js-cookie'
import './components/common/directives';
import store from './store/store';
Vue.use(ElementUI, {
  size: 'small'
});
Vue.prototype.$axios = axios;
Vue.config.productionTip = false;
router.beforeEach((to, from, next) => {
  if (Cookies.get('token')) {
    next();
  }else {
    if (to.path === '/') {
      next();
    } else {
      router.replace('/');
    }
  }
});
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
