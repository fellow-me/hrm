export default {
  namespaced: true,
  state: {
    token: localStorage.getItem('token')
  },
  mutations: {
    SET_TOKEN (state, token) {
      state.token = token
      localStorage.setItem('token', token)
    }
  }
}
