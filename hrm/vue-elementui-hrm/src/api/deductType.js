import request from '../utils/request'

const url = "/deduct-type"

// 查询所有
export const getAll = () => {
  return request({
    url: url + '/all'
  })
}


