<template>
  <div class="manage">

    <!--操作-->
    <div style="margin-bottom: 10px">
      <el-upload :action="importApi" :headers="headers" accept="xlsx" :show-file-list="false"
                 :on-success="handleImportSuccess" :multiple="false"
                 style="display:inline-block">
        <el-button type="success" size="mini"
        >导入 <i class="el-icon-bottom"></i>
        </el-button>
      </el-upload>
      <el-button type="warning" size="mini" @click="exportData" style="margin-left: 10px"
      >导出 <i class="el-icon-top"></i>
      </el-button>
    </div>

    <!------------------------- 搜索 -------------------------------->
    <div class="manage-header">
      <el-form label-width="auto" :model="searchForm.formData"
               :inline="true" size="mini">
        <el-form-item label="姓名" prop="name">
          <el-input
            placeholder="请输入姓名"
            v-model.trim="searchForm.formData.name"
            prefix-icon="el-icon-search"
          />
        </el-form-item>
        <el-form-item label="部门" prop="deptId">
          <el-select
            placeholder="请选择部门"
            v-model="searchForm.formData.deptId"
          >
            <el-option
              v-for="option in searchForm.deptList"
              :key="option.id"
              :label="option.name"
              :value="option.id"
              :disabled="option.disabled"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="search" size="mini">搜索 <i class="el-icon-search"/></el-button>
          <el-button type="danger" @click="reset" size="mini">重置 <i class="el-icon-refresh-left"/></el-button>
        </el-form-item>
      </el-form>
    </div>
    <!------------------------ 数据表格 ----------------------->
    <div class="common-table">
      <el-table
        :data="table.tableData"
        height="85%"
        border
        stripe
        row-key="id"
        :header-cell-style="{background: '#eef1f6',color: '#606266',
        textAlign:'center',fontWeight:'bold',borderWidth:'3px'}"
      >
        <el-table-column prop="staffLeave.code" label="工号" min-width="80" align="center"/>
        <el-table-column prop="staffLeave.name" label="姓名" min-width="80" align="center"/>
        <el-table-column prop="staffLeave.deptName" label="部门" min-width="125" align="center"/>
        <el-table-column prop="staffLeave.phone" label="电话" min-width="125" align="center"/>
        <el-table-column prop="staffLeave.createTime" label="申请时间" min-width="180" align="center"/>
        <el-table-column prop="staffLeave.typeNum" label="类型" min-width="125" align="center"/>
        <el-table-column prop="staffLeave.startDate" label="开始日期" min-width="125" align="center"/>
        <el-table-column prop="staffLeave.days" label="天数" min-width="80" align="center"/>
        <el-table-column label="审核状态" min-width="85" align="center">
          <template slot-scope="scope">
            <el-tag :type="scope.row.tagType">{{ scope.row.staffLeave.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="备注" width="200" prop="staffLeave.remark" align="center"/>
        <el-table-column label="操作" width="190" fixed="right" align="center">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" @click="approve(scope.row)"
                       :disabled="scope.row.staffLeave.status!==scope.row.unaudited"
            >批准 <i class="el-icon-check"></i
            ></el-button>
            <el-button size="mini" type="danger" @click="reject(scope.row)"
                       :disabled="scope.row.staffLeave.status!==scope.row.unaudited"
            >驳回 <i class="el-icon-close"></i
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        class="pager"
        layout="total,sizes,prev,pager,next,jumper"
        :page-size="table.pageConfig.size ? table.pageConfig.size : 10"
        :page-sizes="[5, 10, 15, 20]"
        :total="table.pageConfig.total"
        :current-page.sync="table.pageConfig.current"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>
  </div>
</template>
<script>
import { edit, getExportApi, getImportApi, getList } from '../../../api/staffLeave'
import { mapState } from 'vuex'
import { getAllDept } from '@/api/dept'

export default {
  name: 'Leave',
  data () {
    return {
      searchForm: {
        deptList: [],
        formData: {}
      },
      table: {
        tableData: [],
        pageConfig: {
          total: 10, // 记录总数
          current: 1, // 起始页
          size: 10 // 每页展示的记录数
        }
      }
    }
  },
  computed: {
    ...mapState('token', ['token']),
    headers () {
      return { token: this.token }
    },
    // 获取导入数据的接口
    importApi () {
      return getImportApi()
    }

  },
  methods: {
    approve (row) {
      // 通过
      row.staffLeave.status = row.approve
      edit(row.staffLeave).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.success('审批通过')
        }
      })
    },
    reject (row) {
      row.staffLeave.status = row.reject
      edit(row.staffLeave).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.error('驳回')
        }
      })
    },
    handleSizeChange (size) {
      this.table.pageConfig.size = size
      this.loading()
    },
    handleCurrentChange (current) {
      this.table.pageConfig.current = current
      this.loading()
    },
    search () {
      this.loading()
    },
    // 重置搜索表单
    reset () {
      this.searchForm.formData = {}
      this.loading()
    },
    // 将数据渲染到模板
    loading () {
      getAllDept().then(response => {
        const list = []
        response.data.forEach(dept => {
          if (dept.children.length > 0) {
            dept.disabled = true
            list.push(dept)
            dept.children.forEach(subDept => {
              list.push(subDept)
            })
          }
        })
        this.searchForm.deptList = list
      })
      getList({
        current: this.table.pageConfig.current,
        size: this.table.pageConfig.size,
        name: this.searchForm.formData.name,
        deptId: this.searchForm.formData.deptId
      }).then(response => {
        if (response.code === 200) {
          this.table.tableData = response.data.list
          this.table.pageConfig.total = response.data.total
        } else {
          this.$message.error(response.message)
        }
      })
    },
    // 导出数据
    exportData () {
      window.open(getExportApi())
    },
    handleImportSuccess (response) {
      if (response.code === 200) {
        this.$message.success('数据导入成功！')
        this.loading()
      } else {
        this.$message.error('数据导入失败！')
      }
    }
  },
  created () {
    this.loading()
  }
}
</script>
<style lang="less" scoped>
.common-table {
  height: calc(100% - 62px);
  background-color: white;
  position: relative;

  .pager {
    position: absolute;
    bottom: 20px;
    right: 20px;
  }
}

</style>
