import Vue from 'vue' // 引入vue
import VueRouter from 'vue-router' // 引入vue-router
import store from '../store'

// 解决当重复跳转一个路由的报错问题
// 获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
// 修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch((err) => err)
}

Vue.use(VueRouter) // 全局引入路由

// 静态路由
const routes = [{
  path: '/login', name: 'login', component: () => import('../views/login')
}, {
  path: '/404', name: '404', component: () => import('../views/404')
}]

// router实例
const router = new VueRouter({
  mode: 'history', // 此模式下，url不出现"#"
  routes // 记住前面的属性是routes(路线)，而不是routers(路由器)，不然<router-view>的内容不会显示
})

// 重置路由
export const resetRouter = () => {
  router.matcher = new VueRouter({
    mode: 'history', routes
  })
}

// 设置动态路由,刷新页面，会重置路由
export const setDynamicRoute = (menuList) => {
  const currentRoutes = router.getRoutes().map(item => item.name)
  if (!currentRoutes.includes('main')) {
    const dynamicRoute = {
      path: '/', name: 'main', // 路由别名
      component: () => import('../views/Main'), redirect: '/home', children: []
    }
    // 添加添加菜单到dynamicRoute的children中
    menuList.forEach((menu) => {
      const route = {
        name: menu.code, path: menu.code, component: () => import('../views/' + menu.code), children: []
      }
      // 判断是否有子菜单
      if (menu.children.length > 0) {
        menu.children.forEach((subMenu) => {
          route.children.push({
            name: subMenu.code,
            path: subMenu.code,
            component: () => import('../views/' + menu.code + '/' + subMenu.code),
            children: []
          })
        })
      }
      dynamicRoute.children.push(route)
    })
    router.addRoute(dynamicRoute) // addRoute()只负责添加路由，但不去重
  }
}


router.beforeEach((to, from, next) => {
  if (to.matched.length === 0) {
    if (localStorage.getItem("token")) { // 如果有token说明已经登录，否则回到登录页面
      /**
       * 当页面刷新时，vuex中的数据会被重置，所以此时需要调用接口请求菜单数据。
       * 因为menuList默认有home菜单数据，所以如果没有其他的菜单数据，就重新添加
       */
      if (store.state.menu.menuList.length <= 1) {
        store.dispatch("menu/getMenu").then(() => {
          // 等待menuList中的菜单数据添加完成
          setTimeout(() => {
            setDynamicRoute(store.state.menu.menuList)
          }, 300)
        })
        // 等待setDynamicRoute执行完成
        setTimeout(() => {
          next()
        }, 800)
      }
      next()
    } else {
      next({name: 'login'})
    }
  }
  next()
})

export default router // 对外暴露
