import request from '../utils/request'

const url = "/overtime"

// 得到
export const getOvertime = (deptId, typeId) => {
  return request({
    url: url + "/" + deptId + "/" + typeId
  })
}

export const setOvertime = (data) => {
  return request({
    url: url + "/set",
    method: 'post',
    data
  })
}


