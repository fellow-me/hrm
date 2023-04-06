import request from '../utils/request'

const url = '/home'

export const getStaffData = () => {
  return request({
    url: url + '/staff'
  })
}

// 获取统计数据
export const getCountData = () => {
  return request({
    url: url + '/count'
  })
}

// 获取城市社保数据
export const getCityData = () => {
  return request({
    url: url + '/city'
  })
}

// 统计各部门员工人数
export const getDepartmentData = () => {
  return request({
    url: url + '/department'
  })
}

// 获取员工考勤数据
export const getAttendanceData = (params) => {
  return request({
    url: url + '/attendance',
    params
  })
}
