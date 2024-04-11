export default {
  namespaced: true,
  state: {
    permissionList: []
  },
  mutations: {
    SET_PERMISSION (state, list) {
      state.permissionList = list.map(item => item.permission)
    }
  }
}
