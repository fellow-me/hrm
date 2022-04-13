<template>
  <div class="manage">
    <el-dialog
      :title="dialogForm.type === 'add' ? '新增城市社保信息' : '更新城市社保信息'"
      :visible.sync="dialogForm.isShow"
    >
      <CommonForm
        ref="dialogForm"
        :formItemList="dialogForm.formItemList"
        :formData="dialogForm.formData"
        :inline="dialogForm.inline"
        :rules="dialogForm.rules"
      ></CommonForm>

      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirm">确定</el-button>
      </div>
    </el-dialog>

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
} from '../../../api/city'

export default {
  name: 'City',
  components: {
    CommonForm,
    CommonTable
  },
  data() {
    let checkAverageSalary = (rule, value, callback) => {
      if (value < this.dialogForm.formData.lowerSalary) {
        callback(new Error("不低于职工上年度最低月工资！"))
      } else {
        callback()
      }
    }
    return {
      dialogForm: {
        type: 'add', // add为新增，edit为编辑
        isShow: false,
        inline: false,
        formItemList: [
          {
            name: 'name',
            label: '城市名称',
            type: 'input'
          },
          {
            name: 'lowerSalary',
            label: '职工上年度最低月工资',
            type: 'number'
          },
          {
            name: 'averageSalary',
            label: '职工上年度平均月工资',
            type: 'number'
          },
          {
            name: 'socUpperLimit',
            label: '职工社保缴纳基数上限',
            type: 'number',
            disabled: true
          },
          {
            name: 'socLowerLimit',
            label: '职工社保缴纳基数下限',
            type: 'number',
            disabled: true
          },
          {
            name: 'houUpperLimit',
            label: '公积金缴纳基数上限',
            type: 'number',
            disabled: true
          },
          {
            name: 'houLowerLimit',
            label: '公积金缴纳基数下限',
            type: 'number',
            disabled: true
          },
          {
            name: 'perPensionRate',
            label: '养老保险个人缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'comPensionRate',
            label: '养老保险企业缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'perMedicalRate',
            label: '医疗保险个人缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'comMedicalRate',
            label: '医疗保险企业缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'perUnemploymentRate',
            label: '失业保险个人缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'comUnemploymentRate',
            label: '失业保险企业缴费比例',
            type: 'number',
            step: 0.001
          },
          {
            name: 'comMaternityRate',
            label: '生育保险企业缴费比例',
            type: 'number',
            step: 0.001
          }
        ],
        formData: {},
        rules: {
          name: [
            {required: true, message: '请输入城市名称', trigger: 'blur'},
          ],
          lowerSalary: [
            {required: true, message: '请输入职工上年度平均月工资', trigger: 'blur'},
            {type: 'number', min: 500, message: '不低于500元', trigger: 'blur'}
          ],
          averageSalary: [
            {required: true, message: '请输入职工上年度最低月工资', trigger: 'blur'},
            {validator: checkAverageSalary, trigger: 'blur'}
          ],
          perPensionRate: [
            {required: true, message: '请输入养老保险个人缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          comPensionRate: [
            {required: true, message: '请输入养老保险企业缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          perMedicalRate: [
            {required: true, message: '请输入医疗保险个人缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          comMedicalRate: [
            {required: true, message: '请输入医疗保险企业缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          perUnemploymentRate: [
            {required: true, message: '请输入失业保险个人缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          comUnemploymentRate: [
            {required: true, message: '请输入失业保险企业缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ],
          comMaternityRate: [
            {required: true, message: '请输入生育保险企业缴纳比例', trigger: 'blur'},
            {type: 'number', min: 0, max: 1, message: '缴纳比例：0 ~ 1', trigger: 'blur'}
          ]
        }
      },
      searchForm: {
        formItemList: [
          {
            name: 'name',
            label: '城市名称',
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
            name: 'name',
            label: '城市名称',
            type: 'column'
          },
          {
            name: 'socUpperLimit',
            label: '职工社保缴纳基数上限',
            type: 'column',
            width: 150
          },
          {
            name: 'socLowerLimit',
            label: '职工社保缴纳基数下限',
            type: 'column',
            width: 150
          },
          {
            name: 'houUpperLimit',
            label: '公积金缴纳基数上限',
            type: 'column',
            width: 150
          },
          {
            name: 'houLowerLimit',
            label: '公积金缴纳基数下限',
            type: 'column',
            width: 150
          },
          {
            name: 'perPensionRate',
            label: '养老保险个人缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'comPensionRate',
            label: '养老保险企业缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'perMedicalRate',
            label: '医疗保险个人缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'comMedicalRate',
            label: '医疗保险企业缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'perUnemploymentRate',
            label: '失业保险个人缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'comUnemploymentRate',
            label: '失业保险企业缴费比例',
            type: 'column',
            width: 150
          },
          {
            name: 'comMaternityRate',
            label: '生育保险企业缴费比例',
            type: 'column',
            width: 150
          }
        ],
        pageConfig: {
          total: 10, // 记录总数
          current: 1, // 起始页
          size: 10 // 每页展示的记录数
        },
        ids: [],
      }
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
  watch: {
    'dialogForm.formData.averageSalary': function () {
      this.dialogForm.formData.socUpperLimit = 3 * this.dialogForm.formData.averageSalary
      this.dialogForm.formData.socLowerLimit = 0.6 * this.dialogForm.formData.averageSalary
      this.dialogForm.formData.houUpperLimit = 3 * this.dialogForm.formData.averageSalary
    },
    'dialogForm.formData.lowerSalary': function (newVal) {
      this.dialogForm.formData.houLowerLimit = newVal
    }
  },
  methods: {
    // 点击新增按钮，弹出对话框
    handleAdd() {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {}
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
      this.$refs.dialogForm.$refs.form.validate(valid => {
        if (valid) {
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
        } else {
          return false
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
