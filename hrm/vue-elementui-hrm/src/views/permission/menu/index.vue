<template>
  <div class="manage">
    <el-dialog
      :title="dialogForm.type === 'add' ? '新增菜单' : '更新菜单'"
      :visible.sync="dialogForm.isShow"
    >
      <CommonForm
        :formItemList="dialogForm.formItemList"
        :formData="dialogForm.formData"
        :inline="dialogForm.inline"
      ></CommonForm>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirm">确定</el-button>
      </div>
    </el-dialog>

    <div style="margin-bottom: 10px">
      <el-upload :action="importApi" :headers="headers" accept="xlsx" :show-file-list="false"
                 :on-success="handleImportSuccess" :multiple="false"
                 style="display:inline-block;">
        <el-button type="success" size="mini"
        >导入 <i class="el-icon-bottom"></i>
        </el-button>
      </el-upload>
      <el-button type="warning" size="mini" @click="exportData" style="margin-left: 10px"
      >导出 <i class="el-icon-top"></i>
      </el-button>
      <el-button type="primary" @click="handleAdd" size="mini"
      >新增 <i class="el-icon-circle-plus-outline"></i>
      </el-button>
      <el-popconfirm
        style="margin-left: 10px"
        confirm-button-text='确定'
        cancel-button-text='我再想想'
        icon="el-icon-info"
        icon-color="red"
        title="你确定删除吗？"
        @confirm="handleDeleteBatch"
      >
        <el-button type="danger" size="mini" slot="reference"
        >批量删除 <i class="el-icon-remove-outline"></i>
        </el-button>
      </el-popconfirm>
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
    <CommonTable
      :tableData="table.tableData"
      :tableLabel="table.tableLabel"
      :pageConfig="table.pageConfig"
    >
      <template v-slot:slot1="data">
        <el-button type="warning" v-if="data.obj.parentId === 0" @click="handleSubAdd(data)">新增 <i
          class="el-icon-circle-plus-outline"/></el-button>
      </template>
    </CommonTable>
  </div>
</template>
<script>
import CommonForm from '../../../components/CommonForm'
import CommonTable from '../../../components/CommonTable'
import {
  add,
  getList,
  deleteOne,
  edit,
  deleteBatch,
  getImportApi,
  getExportApi
} from '../../../api/menu'

export default {
  name: 'Menu',
  components: {
    CommonForm,
    CommonTable
  },
  data() {
    return {
      dialogForm: {
        type: 'add', // add为新增，edit为编辑
        isShow: false,
        formItemList: [
          {
            name: 'code',
            label: '编号',
            type: 'input'
          },
          {
            name: 'name',
            label: '名称',
            type: 'input'
          },
          {
            name: 'icon',
            label: '图标',
            type: 'input'
          },
          {
            name: 'path',
            label: '路径',
            type: 'input'
          },
          {
            name: 'remark',
            label: '备注',
            type: 'textarea'
          }
        ],
        formData: {},
        inline: true
      },
      searchForm: {
        formItemList: [
          {
            name: 'name',
            label: '名称',
            type: 'input',
            icon: 'el-icon-search'
          }
        ],
        formData: {},
        inline: true
      },
      table: {
        tableData: [],
        tableLabel: [
          {
            name: 'code',
            label: '编号',
            type: 'column'
          },
          {
            name: 'name',
            label: '名称',
            type: 'column'
          },
          {
            name: 'icon',
            label: '图标',
            type: 'column'
          },
          {
            name: 'path',
            label: '路径',
            type: 'column'
          },
          {
            name: 'remark',
            label: '备注',
            type: 'column',
            width: 200
          }
        ],
        pageConfig: {
          total: 10, // 记录总数
          current: 1, // 起始页
          size: 10 // 每页展示的记录数
        }
      },
      ids: [],
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
    // 点击新增按钮，弹出对话框
    handleAdd() {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {}
    },
    handleSubAdd(data) {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {parentId: data.obj.id}
    },
    handleDelete(id) {
      deleteOne(id).then(
        response => {
          if (response.code === 200) {
            this.$message.success("删除成功！")
            this.loading()
          } else {
            this.$message.error("删除失败！")
          }
        }
      )
    },
    handleDeleteBatch() {
      deleteBatch(this.ids).then(response => {
        if (response.code === 200) {
          this.$message.success("批量删除成功！")
          this.loading()
        } else {
          this.$message.error("批量删除失败！")
        }
      })
    },
    handleEdit(row) {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'edit'
      this.dialogForm.formData = row
    },
    confirm() {
      // 通过type来判断是新增还是编辑
      if (this.dialogForm.type === 'add') {
        add(this.dialogForm.formData).then((response) => {
          if (response.code === 200) {
            this.$message.success("添加成功！")
            this.dialogForm.isShow = false
            this.loading()
          } else {
            this.$message.error("添加失败！")
          }
        })
      } else {
        edit(this.dialogForm.formData).then((response) => {
          if (response.code === 200) {
            this.$message.success("修改成功！")
            this.dialogForm.isShow = false
            this.loading()
          } else {
            this.$message.error("修改失败！")
          }
        })
      }
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
  },
  mounted() {
    this.$bus.$on("sizeChange", size => {
      this.table.pageConfig.size = size
      this.loading()
    })
    this.$bus.$on("currentChange", current => {
      this.table.pageConfig.current = current
      this.loading()
    })
    this.$bus.$on("del", row => {
      this.handleDelete(row.id)
    })
    this.$bus.$on("edit", row => {
      this.handleEdit(row)
    })
    this.$bus.$on("selectionChange", val => {
      this.ids = val.map(item => item.id) // [{},{},{}] => [1,2,3]
    })
  },
  beforeDestroy() {
    // 销毁事件
    this.$bus.$off("sizeChange")
    this.$bus.$off("currentChange")
    this.$bus.$off("del")
    this.$bus.$off("edit")
    this.$bus.$off("selectionChange")
  }
}
</script>
