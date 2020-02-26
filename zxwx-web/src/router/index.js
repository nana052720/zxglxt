import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: resolve => require(['../components/page/Login.vue'], resolve)
    },
    {
      path: '/',
      component: resolve => require(['../components/common/Home.vue'], resolve),
      meta: { title: '导航' },
      children:[
        {
          path: '/Index',
          component: resolve => require(['../components/page/Index.vue'], resolve),
          meta: { title: '系统首页' }
        },
        {
          path: '/Subject',
          component: resolve => require(['../components/page/Subject.vue'], resolve),
          meta: { title: '科目管理' }
        },
        {
          path: '/User',
          component: resolve => require(['../components/page/User.vue'], resolve),
          meta: { title: '用户管理' }
        },
        {
          path: '/Img',
          component: resolve => require(['../components/page/Img.vue'], resolve),
          meta: { title: '轮播图管理' }
        },
        {
          path: '/Upload',
          component: resolve => require(['../components/page/Upload.vue'], resolve),
          meta: { title: '上传图片' }
        },
        {
          path: '/Log',
          component: resolve => require(['../components/page/Log.vue'], resolve),
          meta: { title: '开通日志' }
        },
        {
          path: '/School',
          component: resolve => require(['../components/page/School.vue'], resolve),
          meta: { title: '学校管理' }
        },
        {
          path: '/404',
          component: resolve => require(['../components/page/404.vue'], resolve),
          meta: { title: '404' }
        },
      ]
    },
    {
      path: '*',
      redirect: '/404'
    }
  ]
})
