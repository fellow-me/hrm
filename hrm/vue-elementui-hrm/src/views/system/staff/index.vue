<template>
  <div class="manage">
    <el-dialog
      :title="dialogForm.type === 'add' ? '新增用户' : '更新用户'"
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

    <el-dialog title="角色分配" :visible.sync="roleDialog.isShow">
      <el-checkbox-group v-model="roleDialog.checkedData">
        <el-checkbox v-for="(item,index) in roleDialog.roleData" :key="index" :label="item.id" style="margin: 10px"
                     border>{{ item.name }}
        </el-checkbox>
      </el-checkbox-group>
      <div slot="footer" class="dialog-footer">
        <el-button @click="roleDialog.isShow = false">取消</el-button>
        <el-button type="primary" @click="handleSetRole">确定</el-button>
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
        <el-button type="warning" @click="selectRole(data)">分配角色 <i class="el-icon-user-solid"/></el-button>
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
  getExportApi,
  setRole,
  getRole
} from '../../../api/staff'

import {getAll} from "../../../api/role";

import {getAllDept} from "../../../api/dept";

export default {
  name: 'Staff',
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
            name: 'name',
            label: '姓名',
            type: 'input',
          },
          {
            name: 'deptId',
            label: '部门',
            type: 'select',
            optionList: []
          },
          {
            name: 'gender',
            label: '性别',
            type: 'select',
            optionList: [
              {
                name: '男',
                id: 0
              },
              {
                name: '女',
                id: 1
              }
            ]
          },
          {
            name: 'birthday',
            label: '生日',
            type: 'date'
          },
          {
            name: 'phone',
            label: '电话',
            type: 'input'
          },
          {
            name: 'address',
            label: '地址',
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
            label: '姓名',
            type: 'input',
            icon: 'el-icon-search'
          },
          {
            name: 'birthday',
            label: '生日',
            type: 'date',
            placeholder: '请选择起始日期'
          },
          {
            name: 'deptId',
            label: '部门',
            type: 'select',
            optionList: []
          },
          {
            name: 'status',
            label: '状态',
            type: 'select',
            optionList: [
              {
                id: 1,
                name: '正常'
              },
              {
                id: 0,
                name: '异常'
              }
            ]
          }
        ],
        formData: {},
        inline: true
      },
      roleDialog: {
        isShow: false,
        roleData: [],
        checkedData: []
      },
      table: {
        tableData: [],
        tableLabel: [
          {
            name: 'code',
            label: '工号',
            type: 'column'
          },
          {
            name: 'name',
            label: '姓名',
            type: 'column'
          },
          {
            name: 'age',
            label: '年龄',
            type: 'column',
            width: 50
          },

          {
            name: 'deptName',
            label: '部门',
            type: 'column'
          },
          {
            name: 'gender',
            label: '性别',
            type: 'gender',
            width: 50
          },
          {
            name: 'phone',
            label: '电话',
            type: 'column'
          },
          {
            name: 'birthday',
            label: '生日',
            type: 'column'
          },
          {
            name: 'status',
            label: "状态",
            type: 'switch',
            width: 150
          },
          {
            name: 'address',
            label: '地址',
            width: 200,
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
      staffId: 0, // 默认为0
      subDeptList: []
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
    getDept() {
      // 获取所有部门
      getAllDept().then(response => {
        this.dialogForm.formItemList.forEach(item => {
          if (item.name === 'deptId') {
            let list = []
            response.data.forEach(dept => {
              if (dept.children.length > 0) {
                dept.disabled = true
                list.push(dept)
                dept.children.forEach(subDept => {
                  list.push(subDept)
                })
              }
            })
            item.optionList = list
          }
        })
      })
    },
    // 点击新增按钮，弹出对话框
    handleAdd() {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {}
      this.getDept()
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
      this.getDept()
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
      this.searchForm.formData = {}
      this.loading()
    },
    // 将数据渲染到模板
    loading() {
      getAllDept().then(response => {
        this.searchForm.formItemList.forEach(item => {
          if (item.name === 'deptId') {
            let list = []
            response.data.forEach(dept => {
              if (dept.children.length > 0) {
                dept.disabled = true
                list.push(dept)
                dept.children.forEach(subDept => {
                  list.push(subDept)
                })
              }
            })
            item.optionList = list
          }
        })
      })
      getList({
        current: this.table.pageConfig.current,
        size: this.table.pageConfig.size,
      }, this.searchForm.formData).then(response => {
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
    selectRole(data) {
      this.staffId = data.obj.id
      this.roleDialog.isShow = true
      getAll().then(response => {
        if (response.code === 200) {
          this.roleDialog.roleData = response.data
        } else {
          this.$message.error("获取角色数据失败！")
        }
      })
      getRole(this.staffId).then(
        response => {
          if (response.code === 200) {
            this.roleDialog.checkedData = response.data.map(item => item.roleId)
          } else {
            this.$message.error("获取数据失败！")
          }
        }
      )
    },
    handleSetRole() {
      setRole(this.staffId, this.roleDialog.checkedData).then(
        response => {
          if (response.code === 200) {
            this.roleDialog.isShow = false
            this.$message.success("角色分配成功！")
          } else {
            this.$message.error("角色分配失败！")
          }
        }
      )
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
    this.$bus.$on("statusChange", row => {
      edit(row) // 更新
    })
  },
  beforeDestroy() {
    // 销毁事件
    this.$bus.$off("sizeChange")
    this.$bus.$off("currentChange")
    this.$bus.$off("del")
    this.$bus.$off("edit")
    this.$bus.$off("selectionChange")
    this.$bus.$off("statusChange")
  }
}
</script>
