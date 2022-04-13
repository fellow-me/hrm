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

    <!-- 搜索 -->
    <div class="manage-header">
      <CommonForm
        :formItemList="searchForm.formItemList"
        :formData="searchForm.formData"
        :inline="searchForm.inline"
      >
        <el-button type="primary" @click="search" size="mini">搜索 <i class="el-icon-search"/></el-button>
        <el-button type="danger" @click="reset" size="mini">重置 <i class="el-icon-refresh-left"/></el-button>
      </CommonForm>
    </div>
    <!--    数据表格-->
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
        <el-table-column prop="code" label="工号" min-width="125"/>
        <el-table-column prop="name" label="姓名" min-width="125"/>
        <el-table-column prop="phone" label="电话" min-width="125"/>
        <el-table-column prop="typeName" label="类型" min-width="125"/>
        <el-table-column prop="startDate" label="开始日期" min-width="125"/>
        <el-table-column prop="days" label="天数" min-width="125"/>
        <el-table-column prop="createTime" label="申请时间" min-width="150"/>
        <el-table-column label="审核状态" min-width="80">
          <template slot-scope="scope">
            <el-tag :type="table.tagType[scope.row.status]">{{ scope.row.status }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="备注" width="200" prop="remark"/>
        <el-table-column label="操作" width="190" fixed="right">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" @click="approve(scope.row)" :disabled="scope.row.status!=='未审核'"
            >批准 <i class="el-icon-check"></i
            ></el-button>
            <el-button size="mini" type="danger" @click="reject(scope.row)" :disabled="scope.row.status!=='未审核'"
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
import CommonForm from '../../../components/CommonForm'
import {
  getList,
  getImportApi,
  getExportApi,
  edit
} from '../../../api/staffLeave'

export default {
  name: 'Leave',
  components: {
    CommonForm,
  },
  data() {
    return {
      searchForm: {
        formItemList: [
          {
            name: 'name',
            label: '姓名',
            type: 'input',
            icon: 'el-icon-search'
          }
        ],
        formData: {},
        inline: true
      },
      table: {
        tagType: {
          "未审核": "info",
          "审核通过": "success",
          "驳回": "danger"
        },
        tableData: [],
        pageConfig: {
          total: 10, // 记录总数
          current: 1, // 起始页
          size: 10 // 每页展示的记录数
        }
      },
    }
  },
  computed: {
    // 获取导入数据的接口
    importApi() {
      return getImportApi()
    },
    headers() {
      return {
        token: localStorage.getItem("token")
      }
    }
  },
  methods: {
    approve(row) {
      row.status = "审核通过"
      edit(row).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.success("审批通过")
        }
      })
    },
    reject(row) {
      row.status = "驳回"
      edit(row).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.error("驳回")
        }
      })
    },
    handleSizeChange(size) {
      this.table.pageConfig.size = size
      this.loading()
    },
    handleCurrentChange(current) {
      this.table.pageConfig.current = current
      this.loading()
    },
    search() {
      this.loading()
    },
    // 重置搜索表单
    reset() {
      this.searchForm.formData.name = ""
      this.loading()
    },
    // 将数据渲染到模板
    loading() {
      getList({
        current: this.table.pageConfig.current,
        size: this.table.pageConfig.size,
        name: this.searchForm.formData.name
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
    exportData() {
      window.open(getExportApi())
    },
    handleImportSuccess(response) {
      if (response.code === 200) {
        this.$message.success("数据导入成功！")
        this.loading()
      } else {
        this.$message.error("数据导入失败！")
      }
    }
  },
  created() {
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
