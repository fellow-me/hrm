export default {
  namespaced: true,
  state: {
    tagList: JSON.parse(localStorage.getItem('tagList')) || [{
      id: 0,
      name: '首页',
      path: '/home',
      code: 'home'
    }]
  },
  mutations: {
    // 添加标签
    ADD_TAG (state, menu) {
      // 判断当前点击的是否是首页
      if (menu.code !== 'home') {
        // 判断tag是否存在，若存在就不添加
        const result = state.tagList.findIndex(
          item => item.code === menu.code
        )
        if (result === -1) {
          state.tagList.push(menu)
        }
      }
      localStorage.setItem('tagList', JSON.stringify(state.tagList))
    },
    // 关闭标签
    CLOSE_TAG (state, menu) {
      state.tagList = state.tagList.filter(item => item.code !== menu.code)
      localStorage.setItem('tagList', JSON.stringify(state.tagList))
    },
    // 清空标签
    CLEAR_TAG (state) {
      state.tagList = [{
        id: 0,
        name: '首页',
        path: '/home',
        code: 'home'
      }]
    }
  }
}
