<template>
  <el-menu
    default-active="2"
    class="el-menu-vertical-demo"
    :collapse="isCollapse"
    background-color="#545c64"
    text-color="#fff"
    active-text-color="#ffd04b"
  >
    <div style="height: 60px; line-height: 60px; text-align: center">
      <img
        src="../assets/logo.png"
        alt=""
        style="width: 20px; position: relative; top: 5px; margin-right: 5px"
        v-show="!isCollapse"
      />
      <b style="color: #fff; font-weight: bold">
        {{ isCollapse ? '后台' : '人力资源管理系统' }}
      </b>
    </div>
    <el-menu-item
      v-for="item in noChildren"
      :key="item.id"
      :index="item.name"
      @click="clickMenu(item,item.path)"
    >
      <i :class="'el-icon-' + item.icon"></i>
      <span slot="title"> {{ item.name }}</span>
    </el-menu-item>
    <el-submenu v-for="item in hasChildren" :key="item.id" :index="item.name">
      <template slot="title">
        <i :class="'el-icon-' + item.icon"></i>
        <span>{{ item.name }}</span>
      </template>
      <el-menu-item
        v-for="subItem in item.children"
        @click="clickMenu(subItem,item.path + subItem.path)"
        :key="subItem.id"
        :index="subItem.name"
      >
        <i :class="'el-icon-' + subItem.icon"></i>
        <span>{{ subItem.name }}</span>
      </el-menu-item>
    </el-submenu>
  </el-menu>
</template>

<style lang="less" scoped>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}

.el-menu {
  height: 100%;
  border: none; /* 无边框 */

  h3 {
    color: #fff;
    text-align: center; /* 字体居中 */
    line-height: 48px; /* 行高 */
  }
}
</style>

<script>
import {mapState} from "vuex";

export default {
  data() {
    return {
      isCollapse: false // 控制侧边栏是否展开
    }
  },
  methods: {
    clickMenu(menu, path) {
      // 使用编程式，路由导航
      this.$router.push({
        path: path // 点击菜单，进行跳转
      })
      this.$store.commit('tag/ADD_TAG', menu)
    }
  },
  computed: {
    ...mapState("menu", ['menuList']),
    noChildren() {
      return this.menuList.filter(item => item.children.length === 0) // 没有子菜单
    },
    hasChildren() {
      return this.menuList.filter(item => item.children.length > 0) // 有子菜单
    }
  },
  mounted() {
    this.$bus.$on("collapseMenu", () => {
      this.isCollapse = !this.isCollapse
    })
  }
  , beforeDestroy() {
    this.$bus.$off("collapseMenu")
  }
}
</script>
