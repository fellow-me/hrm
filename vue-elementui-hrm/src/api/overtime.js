import request from '../utils/request'

const url = '/overtime'

// 得到
export const getOvertime = (deptId, typeNum) => {
  return request({
    url: url + '/' + deptId + '/' + typeNum
  })
}

export const setOvertime = (data) => {
  return request({
    url: url + '/set', method: 'post', data
  })
}

// 查询所有加班类型
export const getAll = () => {
  return request({
    url: url + '/all'
  })
}
