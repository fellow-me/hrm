import { download } from '@/api/docs'
import store from '../store'

export const setAvatar = (img) => {
  const avatar = store.state.staff.staff.avatar
  if (avatar != null && avatar !== '') { // 当没有头像时，使用默认头像
    download(avatar).then(response => {
      // 如果头像不存在使用默认头像
      if (response.data.size > 0) {
        img.src = window.URL.createObjectURL(new Blob([response.data]))
      } else {
        img.src = require('../assets/images/avatar.png')
      }
    })
  } else {
    img.src = require('../assets/images/avatar.png')
  }
  img.onload = () => {
    URL.revokeObjectURL(img.src)
  }
}
