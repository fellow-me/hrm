import Vue from 'vue'
import Vuex from 'vuex'
import tag from './tag'
import menu from './menu'
import staff from './staff'
import token from './token'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    tag, menu, staff, token
  }
})
