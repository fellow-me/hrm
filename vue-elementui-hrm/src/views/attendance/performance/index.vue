<template>
  <div class="manage">

    <el-dialog
      title="考勤状态"
      :visible.sync="dialog.isShow"
    >
      <el-radio-group v-model="dialog.status">
        <el-radio v-for="(item,index) in dialog.statusList" :key="index" :label="item.message" border/>
      </el-radio-group>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialog.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirm">确定</el-button>
      </div>
    </el-dialog>

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

    <!---------------------- 搜索 ----------------------------->
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
        <el-form-item label="月份" prop="month">
          <el-date-picker
            value-format='yyyyMM'
            type="month"
            placeholder='请选择月份'
            v-model="searchForm.formData.month"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="search" size="mini">搜索 <i class="el-icon-search"/></el-button>
          <el-button type="danger" @click="reset" size="mini">重置 <i class="el-icon-refresh-left"/></el-button>
        </el-form-item>
      </el-form>
    </div>
    <!-------------------------- 数据表格 ---------------------------------->
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
        <el-table-column prop="code" label="工号" min-width="125" align="center"/>
        <el-table-column prop="name" label="姓名" min-width="125" align="center"/>
        <el-table-column prop="deptName" label="部门" min-width="125" align="center"/>
        <el-table-column prop="phone" label="电话" min-width="125" align="center"/>
        <el-table-column v-for="index in dayNum" :label="index+'日'" :key="index" min-width="55">
          <template slot-scope="scope">
            <div @click="changeStatus(scope.row,index-1)">
              <el-tag :type="scope.row.attendanceList[index-1].tagType">
                {{ scope.row.attendanceList[index - 1].message }}
              </el-tag>
            </div>
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
import { getAll, getByStaffIdAndDate, getExportApi, getImportApi, getList, setAttendance } from '../../../api/attendance'
import { mapState } from 'vuex'
import { getAllDept } from '@/api/dept'

export default {
  name: 'Performance',
  data () {
    return {
      dialog: {
        isShow: false,
        data: {},
        status: '',
        statusList: []
      },
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
      },
      dayNum: 0,
      month: ''
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
    confirm () {
      this.dialog.data.status = this.dialog.status
      setAttendance(this.dialog.data).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.success('修改成功')
          this.dialog.isShow = false
        } else {
          this.$message.error('修改失败')
        }
      })
    },
    changeStatus (row, i) {
      getAll().then(response => {
        if (response.code === 200) {
          this.dialog.statusList = response.data
        } else {
          this.$message.error('获取数据失败')
        }
      })
      getByStaffIdAndDate(row.staffId, row.attendanceList[i].attendanceDate).then(response => {
        if (response.code === 200) {
          this.dialog.data = response.data
        } else {
          this.dialog.data = {
            staffId: row.staffId,
            attendanceDate: row.attendanceList[i].attendanceDate
          }
        }
      })
      this.dialog.isShow = true
      this.dialog.status = row.attendanceList[i].message
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
        deptId: this.searchForm.formData.deptId,
        month: this.searchForm.formData.month
      }).then(response => {
        if (response.code === 200) {
          this.table.tableData = response.data.list
          this.table.pageConfig.total = response.data.total
          this.dayNum = response.data.dayNum
          this.month = response.data.month
        } else {
          this.$message.error(response.message)
        }
      })
    },
    // 导出数据
    exportData () {
      window.open(getExportApi(this.month))
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
