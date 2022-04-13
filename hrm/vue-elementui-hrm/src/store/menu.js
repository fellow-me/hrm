import {getStaffMenu} from "../api/menu"

export default {
  namespaced: true,
  state: {
    // 首页是所有员工都可访问的
    menuList: [
      {
        id: 0,
        code: 'home',
        name: '首页',
        icon: 's-home',
        path: '/home',
        children: []
      }
    ]
  },
  actions: {
    // 获取员工的菜单
    getMenu(context) {
      let staff = JSON.parse(localStorage.getItem("staff"))
      if (staff) {
        getStaffMenu(staff.id).then(
          response => {
            if (response.code === 200) {
              context.commit("SET_MENU", response.data)
            }
          }
        )
      }
    }
  },
  mutations: {
    SET_MENU(state, menus) {
      menus.forEach(menu => {
        state.menuList.push(menu)
      })
    },
    CLEAR_MENU(state){
      state.menuList = [
        {
          id: 0,
          code: 'home',
          name: '首页',
          icon: 's-home',
          path: '/home',
          children: []
        }
      ]
    }
  }
}
