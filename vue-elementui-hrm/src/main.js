import Vue from 'vue'
import App from './App.vue'
import ElementUI from 'element-ui' // 按需引入elementui
import 'element-ui/lib/theme-chalk/index.css' // 全局引入elementui的css文件
import './assets/less/index.less'

import store from './store'
import router from './router' // 引入vue路由

Vue.config.productionTip = false

// 全局注入elementui，会引入全部的组件，增大了项目的体积
Vue.use(ElementUI, { size: 'mini' })

new Vue({
  store,
  router,
  beforeCreate () {
    Vue.prototype.$bus = this // 安装全局事件总线
  },
  render: (h) => h(App)
}).$mount('#app')
