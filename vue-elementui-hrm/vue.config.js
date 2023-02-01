module.exports = {
  lintOnSave: false, // 关闭语法检查
  devServer: {
    proxy: {
      '/api': {
        // 请求前缀
        target: 'http://localhost:' + process.env.VUE_APP_PORT, pathRewrite: {'^/api': ''}, changeOrigin: true // 用于控制请求头中的host值
      }
    }
  }
}
