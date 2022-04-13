import request from '../utils/request'

const url = "/salary-deduct"

// 得到
export const getSalaryDeduct = (deptId, typeId) => {
  return request({
    url: url + "/" + deptId + "/" + typeId
  })
}

export const setSalaryDeduct = (data) => {
  return request({
    url: url + "/set",
    method: 'post',
    data
  })
}


