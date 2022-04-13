import request from "../utils/request";



// 登录
export const login = (data) => {
  return request({
    url: '/login',
    method: 'post',
    data
  })
}

// 通过账号查询员工
export const findByCode = (params) => {
  return request({
    url: '/find',
    method: 'GET',
    params
  })
}
