<template>
  <div class="manage">
    <el-dialog
      title="新增"
      :visible.sync="addForm.isShow"
    >
      <CommonForm
        ref="dialogForm"
        :formItemList="addForm.formItemList"
        :formData="addForm.formData"
        :inline="addForm.inline"
      ></CommonForm>

      <div slot="footer" class="dialog-footer">
        <el-button @click="addForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirmAdd">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog
      title="编辑"
      :visible.sync="editForm.isShow"
    >
      <el-form>
        <el-form-item label="备注：" label-width="80px">
          <el-input type="textarea"
                    placeholder="请输入内容"
                    v-model.trim="editForm.formData.remark"
                    :autosize="{ minRows: 2, maxRows: 4}"
                    maxlength="100"
                    show-word-limit/>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="editForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirmEdit">确定</el-button>
      </div>
    </el-dialog>


    <div style="margin-bottom: 10px">
      <el-upload :action="importApi" :headers="headers" accept="xlsx" :show-file-list="false" :multiple="false"
                 :on-success="handleImportSuccess"
                 style="display:inline-block;">
        <el-button type="success" size="mini"
        >导入 <i class="el-icon-bottom"></i>
        </el-button>
      </el-upload>
      <el-button type="warning" size="mini" @click="exportData" style="margin-left: 10px"
      >导出 <i class="el-icon-top"></i>
      </el-button>
      <el-button type="primary" @click="handleAdd" size="mini"
      >上传 <i class="el-icon-circle-plus-outline"></i>
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
        <el-button type="warning" @click="download(data)">下载 <i class="el-icon-download"/></el-button>
      </template>
    </CommonTable>
  </div>
</template>
<script>
import CommonForm from '../../../components/CommonForm'
import CommonTable from '../../../components/CommonTable'
import {
  deleteOne,
  edit,
  getList,
  deleteBatch,
  getImportApi,
  getExportApi,
  getUploadApi,
  getDownloadApi
} from '../../../api/docs'

export default {
  name: 'Docs',
  components: {
    CommonForm,
    CommonTable
  },
  data() {
    return {
      addForm: {
        isShow: false,
        formItemList: [
          {
            name: 'file',
            label: '文件上传',
            type: 'upload',
            uploadUrl: getUploadApi(), // 上传文件的接口
            headers: this.headers // 携带的头部数据
          }, {
            name: 'remark',
            label: '备注',
            type: 'textarea'
          }
        ],
        formData: {},
        inline: false
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
      editForm: {
        isShow: false,
        formData: {}
      },
      table: {
        tableData: [],
        tableLabel: [
          {
            name: 'name',
            label: '文件名称',
            type: 'column',
            width: 200
          },
          {
            name: 'type',
            label: '文件类型',
            type: 'column'
          },
          {
            name: 'oldName',
            label: '文件原名称',
            type: 'column'
          },
          {
            name: 'size',
            label: '文件大小（KB）',
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
      ids: []
    }
  },
  computed: {
    // 获取导入数据的接口
    importApi() {
      return getImportApi()
    },
    uploadApi() {
      return getUploadApi()
    },
    headers() {
      return {token: localStorage.getItem("token")}
    }
  },
  methods: {
    // 点击新增按钮，弹出对话框
    handleAdd() {
      this.addForm.isShow = true
      this.addForm.formData = {}
    },
    confirmAdd() {
      edit(this.addForm.formData).then((response) => {
        if (response.code === 200) {
          this.$message.success("添加成功！")
          this.addForm.isShow = false
          this.loading()
        } else {
          this.$message.error("添加失败！")
        }
      })
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
      this.editForm.isShow = true
      this.editForm.formData = row
    },
    confirmEdit() {
      edit(this.editForm.formData).then((response) => {
        if (response.code === 200) {
          this.$message.success("修改成功！")
          this.editForm.isShow = false
          this.loading()
        } else {
          this.$message.error("修改失败！")
        }
      })
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
    },
    download(data) {
      window.open(getDownloadApi() + data.obj.name)
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
    this.$bus.$on('uploadSuccess', docs => {
      this.addForm.formData.id = docs.id
    })
  },
  beforeDestroy() {
    // 销毁事件
    this.$bus.$off("sizeChange")
    this.$bus.$off("currentChange")
    this.$bus.$off("del")
    this.$bus.$off("edit")
    this.$bus.$off("selectionChange")
    this.$bus.$off("uploadSuccess")
  }
}
</script>
