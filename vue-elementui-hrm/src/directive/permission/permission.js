import store from '@/store'

function checkPermission (el, binding) {
  const { value } = binding
  // 已拥有的权限
  const hasPermission = store.getters && store.getters.permissionList
  if (value && value instanceof Array) {
    if (value.length > 0) {
      // 需要的权限
      const requiredPermission = value
      // 如果已有权限中存在至少一条需要的权限，就授权
      const flag = hasPermission.some(item => {
        return requiredPermission.includes(item)
      })
      if (!flag) {
        // 方式一 直接不显示按钮
        // el.parentNode && el.parentNode.removeChild(el)
        // -------------------------------------------------------------
        // 方式二 禁用按钮
        el.disabled = true
        el.style.opacity = 0.6
        el.style.cursor = 'not-allowed' // 出现禁用标识
      }
    }
  } else {
    throw new Error('请指定权限字符串！')
  }
}

export default {
  inserted (el, binding) {
    checkPermission(el, binding)
  }
}
