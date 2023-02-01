<template>
  <el-container style="height: 100%">
    <el-aside width="auto" style="box-shadow: 2px 0 6px rgb(0 21 41 / 35%)">
      <common-aside/>
      <!-- 引入侧边栏 -->
    </el-aside>
    <el-container>
      <el-header>
        <common-header/>
        <!-- 引入顶栏 -->
      </el-header>
      <!-- 引入标签栏 -->
      <common-tag/>
      <el-main>
        <router-view/>
        <!-- 路由视图 -->
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
// @ is an alias to /src
import CommonAside from '../components/CommonAside'
import CommonHeader from '../components/CommonHeader'
import CommonTag from '../components/CommonTag'

export default {
  name: 'Main',
  components: {
    CommonAside,
    CommonHeader,
    CommonTag
  }
}
</script>

<style lang="less">
.el-header {
  background-color: #333;
}

.el-main {
  padding-top: 0;
}
</style>
