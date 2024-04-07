import request from '../utils/request'

const url = '/menu'

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

// 分页条件查询
export const getList = (params) => {
  return request({
    url: url,
    method: 'get',
    params
  })
}

// 查询所有
export const getAll = () => {
  return request({
    url: url + '/all'
  })
}

// 获取员工的菜单
export const getStaffMenu = (id) => {
  return request({
    url: url + '/staff/' + id
  })
}

export const exp = (filename) => {
  return request({
    url: url + '/export/' + filename,
    method: 'get',
    responseType: 'blob'
  })
}

// 数据导入
export const getImportApi = () => {
  return process.env.VUE_APP_HOST + ':' + process.env.VUE_APP_PORT + url + '/import'
}
