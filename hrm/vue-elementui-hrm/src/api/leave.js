import request from '../utils/request'

const url = "/leave"

// 得到
export const getLeave = (deptId, typeId) => {
  return request({
    url: url + "/" + deptId + "/" + typeId
  })
}

export const setLeave = (data) => {
  return request({
    url: url + "/set",
    method: 'post',
    data
  })
}


// 得到
export const getLeaveBydeptId = (deptId) => {
  return request({
    url: url + "/dept/" + deptId
  })
}

