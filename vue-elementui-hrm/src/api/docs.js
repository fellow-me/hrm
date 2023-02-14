import request from '../utils/request'

const url = '/docs'
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

export const getList = (params) => {
  return request({
    url: url,
    method: 'get',
    params
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

// 文件上传
export const getUploadApi = () => {
  return 'http://localhost:' + process.env.VUE_APP_PORT + url + '/upload'
}

// 文件下载
export const getDownloadApi = () => {
  return 'http://localhost:' + process.env.VUE_APP_PORT + url + '/download/'
}
