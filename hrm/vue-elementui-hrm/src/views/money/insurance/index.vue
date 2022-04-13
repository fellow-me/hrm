<template>
  <div class="manage">

    <el-dialog
      title="五险一金"
      :visible.sync="dialogForm.isShow"
    >
      <div>
        <el-form
          label-width="100px"
          ref="form"
          :model="dialogForm.formData"
          :rules="dialogForm.rules"
          size="mini">
          <el-form-item label="参保城市" prop="cityId">
            <el-select
              v-model="dialogForm.formData.cityId"
              placeholder="请选择参保城市" @change="selectChange" style="width:38%"
            >
              <el-option v-for="item in dialogForm.cityList" :key="item.id" :value="item.id" :label="item.name"/>
            </el-select>
          </el-form-item>

          <el-form-item label="社保基数" prop="socialBase">
            <el-input-number v-model="dialogForm.formData.socialBase" style="width:38%" :precision="3"/>
            （基数范围：{{ insuranceTable.tableData[0].socLowerLimit }}￥ ~ {{ insuranceTable.tableData[0].socUpperLimit }}￥）
          </el-form-item>

          <el-form-item label="工伤比例" prop="comInjuryRate">
            <el-input-number v-model="dialogForm.formData.comInjuryRate" style="width:38%" :step="0.001"
                             :precision="3"/>
            （比例范围：0.002 ~ 0.019，推荐0.019）
          </el-form-item>

          <el-form-item label="社保缴纳">
            <el-form-item label="个人" prop="perSocialPay" label-width="50px" style="display:inline-block">
              <el-input-number
                v-model="dialogForm.formData.perSocialPay"
                :disabled="true"
                :controls="false"
                :precision="3"
              ></el-input-number>
            </el-form-item>
            <el-form-item label="公司" prop="comSocialPay" label-width="50px" style="display:inline-block">
              <el-input-number
                v-model="dialogForm.formData.comSocialPay"
                :disabled="true"
                :controls="false"
                :precision="3"
              ></el-input-number>
            </el-form-item>
            <el-table :data="insuranceTable.tableData" border stripe>
              <el-table-column label="养老保险缴费比例">
                <el-table-column label="个人" prop="perPensionRate"/>
                <el-table-column label="企业" prop="comPensionRate"/>
              </el-table-column>
              <el-table-column label="医疗保险缴费比例">
                <el-table-column label="个人" prop="perMedicalRate"/>
                <el-table-column label="企业" prop="comMedicalRate"/>
              </el-table-column>
              <el-table-column label="失业保险缴费比例">
                <el-table-column label="个人" prop="perUnemploymentRate"/>
                <el-table-column label="企业" prop="comUnemploymentRate"/>
              </el-table-column>
              <el-table-column label="生育保险企业缴费比例" prop="comMaternityRate"/>
            </el-table>

          </el-form-item>
          <el-form-item label="社保备注" prop="socialRemark">
            <el-input
              v-model.trim="dialogForm.formData.socialRemark"
              type="textarea"
              :rows="2"
              placeholder="1-300字符"
              maxlength="300"
              style="width:38%"
              show-word-limit
            ></el-input>
          </el-form-item>

          <el-form-item label="公积金基数" prop="houseBase">
            <el-input-number v-model="dialogForm.formData.houseBase" style="width:38%" :precision="3"/>
            （基数范围：{{ insuranceTable.tableData[0].houLowerLimit }}￥ ~ {{ insuranceTable.tableData[0].houUpperLimit }}￥）
          </el-form-item>
          <el-form-item label="企业比例" prop="comHouseRate">
            <el-input-number v-model="dialogForm.formData.comHouseRate" style="width:38%" :precision="3" :step="0.001"/>
            （比例范围：0.05 ~ 0.12，推荐0.12）
          </el-form-item>
          <el-form-item label="个人比例" prop="perHouseRate">
            <el-input-number v-model="dialogForm.formData.perHouseRate" style="width:38%" :precision="3" :step="0.001"/>
            （比例范围：0.05 ~ 0.12，推荐0.12）
          </el-form-item>
          <el-form-item label="公积金缴纳">
            <el-form-item label="个人" label-width="50px" style="display:inline-block" prop="perHousePay">
              <el-input-number v-model="dialogForm.formData.perHousePay" :disabled="true"
                               :controls="false" :precision="3"/>
            </el-form-item>
            <el-form-item label="公司" label-width="50px" style="display:inline-block" prop="comHousePay">
              <el-input-number v-model="dialogForm.formData.comHousePay" :disabled="true"
                               :controls="false" :precision="3"/>
            </el-form-item>
          </el-form-item>
          <el-form-item label="公积金备注" prop="houseRemark">
            <el-input v-model.trim="dialogForm.formData.houseRemark" type="textarea" :rows="2" placeholder="1-300字符"
                      style="width:38%" maxlength="300"
                      show-word-limit/>
          </el-form-item>
        </el-form>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="edit">确定</el-button>
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
      <el-button type="warning" size="mini" @click="exportData" style="margin-left: 10px">导出 <i class="el-icon-top"></i>
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
        <el-table-column prop="deptName" label="部门" min-width="125"/>
        <el-table-column prop="phone" label="电话" min-width="125"/>
        <el-table-column label="社保">
          <el-table-column prop="socialBase" label="缴纳基数" min-width="125"/>
          <el-table-column label="个人">
            <el-table-column prop="perSocialPay" label="缴纳费用" min-width="125"/>
          </el-table-column>
          <el-table-column label="企业">
            <el-table-column prop="comInjuryRate" label="工伤保险缴纳比例" min-width="125"/>
            <el-table-column prop="comSocialPay" label="缴纳费用" min-width="125"/>
          </el-table-column>
          <el-table-column prop="socialRemark" label="备注" min-width="200"/>
        </el-table-column>
        <el-table-column label="公积金">
          <el-table-column prop="houseBase" label="缴纳基数" min-width="125"/>
          <el-table-column label="个人">
            <el-table-column prop="perHouseRate" label="缴纳比例" min-width="125"/>
            <el-table-column prop="perHousePay" label="缴纳费用" min-width="125"/>
          </el-table-column>
          <el-table-column label="企业">
            <el-table-column prop="comHouseRate" label="缴纳比例" min-width="125"/>
            <el-table-column prop="comHousePay" label="缴纳费用" min-width="125"/>
          </el-table-column>
          <el-table-column prop="houseRemark" label="备注" min-width="200"/>
        </el-table-column>
        <el-table-column label="操作" width="190" fixed="right">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" @click="handleEdit(scope.row)"
            >明细 <i class="el-icon-edit"></i
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
  getOne as getInsurance,
  setInsurance
} from '../../../api/insurance'
import {
  getAll, getOne
} from '../../../api/city'

export default {
  name: 'Insurance',
  components: {
    CommonForm
  },
  data() {
    let checkSocialBase = (rule, value, callback) => {
      if (value < this.insuranceTable.tableData[0].socLowerLimit || value > this.insuranceTable.tableData[0].socUpperLimit) {
        callback(new Error("社保基数应该在" + this.insuranceTable.tableData[0].socLowerLimit + " ~ " + this.insuranceTable.tableData[0].socUpperLimit + "之间"))
      } else {
        callback()
      }
    }
    let checkComInjuryRate = (rule, value, callback) => {
      if (value < 0.002 || value > 0.019) {
        callback(new Error("工伤保险企业缴费比例应在0.002 ~ 0.019之间"))
      } else {
        callback()
      }
    }
    let checkHouseBase = (rule, value, callback) => {
      if (value < this.insuranceTable.tableData[0].houLowerLimit || value > this.insuranceTable.tableData[0].houUpperLimit) {
        callback(new Error("公积金基数应该在" + this.insuranceTable.tableData[0].houLowerLimit + " ~ " + this.insuranceTable.tableData[0].houUpperLimit + "之间"))
      } else {
        callback()
      }
    }
    let checkHouseRate = (rule, value, callback) => {
      if (value < 0.05 || value > 0.12) {
        callback(new Error("公积金缴费比例应在0.05 ~ 0.12之间"))
      } else {
        callback()
      }
    }
    return {
      dialogForm: {
        isShow: false,
        cityList: [],
        formData: {},
        rules: {
          cityId: [
            {required: true, message: "请选择参保地", trigger: 'change'}
          ],
          socialBase: [
            {required: true, message: "请输入社保基数", trigger: 'blur'},
            {validator: checkSocialBase, trigger: 'blur'}
          ],
          comInjuryRate: [
            {required: true, message: "请输入工伤保险企业缴费比例", trigger: 'blur'},
            {validator: checkComInjuryRate, trigger: 'blur'}
          ],
          houseBase: [
            {required: true, message: "请输入公积金基数", trigger: 'blur'},
            {validator: checkHouseBase, trigger: 'blur'}
          ],
          comHouseRate: [
            {required: true, message: "请输入公积金企业缴费比例", trigger: 'blur'},
            {validator: checkHouseRate, trigger: 'blur'}
          ],
          perHouseRate: [
            {required: true, message: "请输入公积金个人缴费比例", trigger: 'blur'},
            {validator: checkHouseRate, trigger: 'blur'}
          ]
        }
      },
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
        tableData: [],
        pageConfig: {
          total: 10, // 记录总数
          current: 1, // 起始页
          size: 10 // 每页展示的记录数
        }
      },
      insuranceTable: {
        tableData: [{
          socLowerLimit: 0,
          socUpperLimit: 0,
          houLowerLimit: 0,
          houUpperLimit: 0
        }],
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
    'dialogForm.formData.socialBase': function () {
      this.calculatePerSocialPay()
      this.calculateComSocialPay()
    },
    'dialogForm.formData.comInjuryRate': function () {
      this.calculateComSocialPay()
    },
    'dialogForm.formData.houseBase': function () {
      this.calculatePerHousePay()
      this.calculateComHousePay()
    },
    'dialogForm.formData.comHouseRate': function () {
      this.calculateComHousePay()
    },
    'dialogForm.formData.perHouseRate': function () {
      this.calculatePerHousePay()
    }
  },
  methods: {
    calculatePerSocialPay() {
      this.dialogForm.formData.perSocialPay = (this.insuranceTable.tableData[0].perPensionRate +
        this.insuranceTable.tableData[0].perMedicalRate +
        this.insuranceTable.tableData[0].perUnemploymentRate) * this.dialogForm.formData.socialBase
    },
    calculateComSocialPay() {
      this.dialogForm.formData.comSocialPay = (this.insuranceTable.tableData[0].comPensionRate +
        this.insuranceTable.tableData[0].comMedicalRate +
        this.insuranceTable.tableData[0].comUnemploymentRate + this.insuranceTable.tableData[0].comMaternityRate +
        this.dialogForm.formData.comInjuryRate) * this.dialogForm.formData.socialBase
    },
    calculatePerHousePay() {
      this.dialogForm.formData.perHousePay = this.dialogForm.formData.perHouseRate * this.dialogForm.formData.houseBase
    },
    calculateComHousePay() {
      this.dialogForm.formData.comHousePay = this.dialogForm.formData.comHouseRate * this.dialogForm.formData.houseBase
    },
    handleEdit(row) {
      this.dialogForm.formData = {}
      this.dialogForm.isShow = true
      this.dialogForm.formData.staffId = row.staffId
      this.getCity()
      if (row.cityId !== null) {
        getOne(row.cityId).then(response => {
          if (response.code === 200) {
            this.insuranceTable.tableData = [response.data]
          } else {
            this.$message.error(response.message)
          }
        })
        getInsurance(row.insuranceId).then(response => {
          if (response.code === 200) {
            this.dialogForm.formData = response.data
          } else {
            this.$message.error(response.message)
          }
        })
      }
    },
    edit() {
      this.$refs.form.validate(valid => {
        if (valid) {
          setInsurance(this.dialogForm.formData).then(response => {
            if (response.code === 200) {
              this.$message.success("设置成功！")
              this.dialogForm.isShow = false
              this.loading()
            } else {
              this.$message.error("设置失败！")
            }
          })
        } else {
          return false
        }
      })
    },
    // 获取社保城市
    getCity() {
      getAll().then(response => {
        if (response.code === 200) {
          this.dialogForm.cityList = response.data
        } else {
          this.$message.error("数据获取失败")
        }
      })
    },
    selectChange(id) {
      console.log("城市id", id)
      this.dialogForm.cityList.forEach(item => {
        if (item.id === id) {
          this.insuranceTable.tableData = [item]
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
