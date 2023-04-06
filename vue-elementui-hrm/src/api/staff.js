import request from '../utils/request'

const url = '/staff'

/**
 * 添加
 * @param data
 * @returns {AxiosPromise}
 */
export const add = (data) => {
  return request({
    url: url,
    method: 'post',
    data
  })
}

/**
 * 逻辑删除
 * @param id
 * @returns {AxiosPromise}
 */
export const deleteOne = (id) => {
  return request({
    url: url + '/' + id,
    method: 'delete'
  })
}

export const deleteBatch = (ids) => {
  return request({
    url: url + '/batch/' + ids,
    method: 'delete'
  })
}

export const edit = (data) => {
  return request({
    url: url,
    method: 'put',
    data
  })
}

export const getList = (params, data) => {
  return request({
    url: url + '/page',
    method: 'post',
    params,
    data
  })
}

// 数据导入
export const getImportApi = () => {
  return 'http://localhost:' + process.env.VUE_APP_PORT + url + '/import'
}

// 数据导出
export const getExportApi = () => {
  return 'http://localhost:' + process.env.VUE_APP_PORT + url + '/export'
}

// 为员工设置角色
export const setRole = (id, data) => {
  return request({
    url: url + '/role/' + id,
    method: 'post',
    data
  })
}

// 获取员工的角色
export const getRole = (id) => {
  return request({
    url: url + '/role/' + id
  })
}

// 得到一条数据
export const getOne = (id) => {
  return request({
    url: url + '/' + id
  })
}

// 得到一条数据
export const getInfo = (id) => {
  return request({
    url: url + '/info/' + id
  })
}

// 检查员工的密码
export const checkPassword = (pwd, id) => {
  return request({
    url: url + '/check/' + pwd + '/' + id
  })
}

export const updatePassword = (data) => {
  return request({
    url: url + '/pwd',
    method: 'put',
    data
  })
}
