import axios from 'axios'
import ElementUI from 'element-ui'
import store from '../store'

const instance = axios.create({
  baseURL: process.env.VUE_APP_BASE_API,
  timeout: 10000 // 超时设置
})

/**
 * request 拦截器
 */
instance.interceptors.request.use(config => {
  config.headers['Content-Type'] = 'application/json;charset=utf-8'
  config.headers.Authorization = 'Bearer ' + store.getters.token
  return config
}, error => {
  return Promise.reject(error)
})

/**
 * response 拦截器
 */
instance.interceptors.response.use(response => {
  const res = response.data
  // 文件特殊处理
  if (response.request.responseType === 'blob' || response.request.responseType === 'arraybuffer') {
    return response
  }
  // 用户不存在、状态异常、认证失败，直接退出登录
  if (res.code === 400 || res.code === 500 || res.code === 1200) {
    ElementUI.Message({
      message: res.message,
      type: 'error',
      duration: 5 * 1000
    })
    store.dispatch('staff/logout').then(() => {
      return Promise.reject(res.message)
    })
  } else {
    return res
  }
}, error => {
  ElementUI.Message({
    message: error.message,
    type: 'error',
    duration: 5 * 1000
  })
  return Promise.reject(error)
})

export default instance
