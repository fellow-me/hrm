<template>
  <div class="manage">
    <el-dialog
      :title="dialogForm.type === 'add' ? '新增部门' : '更新部门'"
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

    <el-dialog :title="settingDialog.activeTabLabel" :visible.sync="settingDialog.isShow">
      <el-tabs type="border-card" @tab-click="clickTab" v-model="settingDialog.activeTabName">
        <el-tab-pane label="出勤设置" name="workTime">
          <el-form ref="workTimeForm" label-width="100px" size="mini" :model="settingDialog.workTimeForm.formData"
                   :rules="settingDialog.workTimeForm.rules">
            <el-form-item label="出勤时间" style="margin-top:10px">
              <el-form-item label="早上" label-width="40px" style="margin-bottom: 5px">
                <el-form-item style="display:inline-block" prop="morStartTime">
                  <el-time-select
                    placeholder="开始"
                    :editable="false"
                    :picker-options="settingDialog.workTimeForm.morning.startOption"
                    v-model="settingDialog.workTimeForm.formData.morStartTime"
                  />
                </el-form-item>
                <span> - </span>
                <el-form-item style="display:inline-block" prop="morEndTime">
                  <el-time-select
                    placeholder="结束"
                    :editable="false"
                    :picker-options="settingDialog.workTimeForm.morning.endOption"
                    v-model="settingDialog.workTimeForm.formData.morEndTime"
                  />
                </el-form-item>
              </el-form-item>
              <el-form-item label="下午" label-width="40px">
                <el-form-item style="display:inline-block" prop="aftStartTime">
                  <el-time-select
                    placeholder="开始"
                    :editable="false"
                    :picker-options="settingDialog.workTimeForm.afternoon.startOption"
                    v-model="settingDialog.workTimeForm.formData.aftStartTime"/>
                </el-form-item>
                <span> - </span>
                <el-form-item style="display:inline-block" prop="aftEndTime">
                  <el-time-select
                    placeholder="结束"
                    :editable="false"
                    :picker-options="settingDialog.workTimeForm.afternoon.endOption"
                    v-model="settingDialog.workTimeForm.formData.aftEndTime"/>
                </el-form-item>
              </el-form-item>
            </el-form-item>
          </el-form>
        </el-tab-pane>
        <el-tab-pane label="请假设置" name="leave">
          <el-form ref="leaveForm" label-width="100px" size="mini" :model="settingDialog.leaveForm.formData"
                   :rules="settingDialog.leaveForm.rules">
            <el-form-item label="假期类型" prop="typeId">
              <el-select v-model="settingDialog.leaveForm.formData.typeId" style="width:38%" @change="changeLeaveType">
                <el-option v-for="(item,index) in settingDialog.leaveForm.leaveTypeList" :key="index" :value="item.id"
                           :disabled="item.status===0"
                           :label="item.name"/>
              </el-select>
            </el-form-item>
            <el-form-item label="状态">
              <el-switch v-model="settingDialog.leaveForm.formData.status"
                         :disabled="settingDialog.leaveForm.disabled"
                         active-color="#13ce66"
                         inactive-color="#ff4949"
                         active-text="启用"
                         inactive-text="禁用"
                         :active-value="1"
                         :inactive-value="0"/>
            </el-form-item>
            <el-form-item label="休假天数" prop="days">
              <el-input-number v-model="settingDialog.leaveForm.formData.days" :min="1" style="width:38%" step-strictly
                               :disabled="settingDialog.leaveForm.formData.status===0"/>
            </el-form-item>
            <el-form-item label="备注">
              <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}"
                        v-model.trim="settingDialog.leaveForm.formData.remark"
                        :disabled="settingDialog.leaveForm.formData.status===0"
                        maxlength="100"
                        show-word-limit style="width:50%"/>
            </el-form-item>
          </el-form>
        </el-tab-pane>
<!--        <el-tab-pane label="扣款设置" name="deduct">-->
<!--          <el-form ref="deductForm" label-width="100px" size="mini" :model="settingDialog.deductForm.formData"-->
<!--                   :rules="settingDialog.deductForm.rules">-->
<!--            <el-form-item label="扣款类型" prop="typeId">-->
<!--              <el-select v-model="settingDialog.deductForm.formData.typeId" style="width:38%"-->
<!--                         @change="changeDeductType">-->
<!--                <el-option v-for="(item,index) in settingDialog.deductForm.deductTypeList" :key="index" :value="item.id"-->
<!--                           :disabled="item.status===0"-->
<!--                           :label="item.name"/>-->
<!--              </el-select>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="状态">-->
<!--              <el-switch v-model="settingDialog.deductForm.formData.status"-->
<!--                         :disabled="settingDialog.deductForm.disabled"-->
<!--                         active-color="#13ce66"-->
<!--                         inactive-color="#ff4949"-->
<!--                         active-text="启用"-->
<!--                         inactive-text="禁用"-->
<!--                         :active-value="1"-->
<!--                         :inactive-value="0"/>-->
<!--            </el-form-item>-->

<!--            <el-form-item label="计数类型">-->
<!--              <el-radio-group v-model="settingDialog.deductForm.formData.countType"-->
<!--                              :disabled="settingDialog.deductForm.formData.status===0">-->
<!--                <el-radio v-for="(item,index) in settingDialog.deductForm.countTypeList" :key="index"-->
<!--                          :label="index">{{ item }}-->
<!--                </el-radio>-->
<!--              </el-radio-group>-->
<!--            </el-form-item>-->

<!--            <el-form-item label="设置">-->
<!--              <el-row>-->
<!--                <el-col>-->
<!--                  <el-form-item label="小于" label-width="50px" prop="timeLimit">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="0"-->
<!--                                     v-model="settingDialog.deductForm.formData.timeLimit"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                    <span>&nbsp;&nbsp;{{-->
<!--                        settingDialog.deductForm.countTypeList[settingDialog.deductForm.formData.countType]-->
<!--                      }}</span>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--              </el-row>-->

<!--              <el-row>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="小于" prop="ltTimesLimit">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="0"-->
<!--                                     v-model="settingDialog.deductForm.formData.ltTimesLimit"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="次，每次扣款" label-width="120px" prop="llDeduct">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="2"-->
<!--                                     v-model="settingDialog.deductForm.formData.llDeduct"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="1" :offset="1"><span>&nbsp;&nbsp;&nbsp;元</span></el-col>-->
<!--              </el-row>-->

<!--              <el-row>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="大于">-->
<!--                    <el-input-number :controls="false" v-model="settingDialog.deductForm.formData.ltTimesLimit"-->
<!--                                     disabled/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="次，每次扣款" label-width="120px" prop="lgDeduct">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="2"-->
<!--                                     v-model="settingDialog.deductForm.formData.lgDeduct"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="1" :offset="1"><span>&nbsp;&nbsp;&nbsp;元</span></el-col>-->
<!--              </el-row>-->


<!--              <el-row>-->
<!--                <el-col>-->
<!--                  <el-form-item label="大于" label-width="50px">-->
<!--                    <el-input-number :controls="false" v-model="settingDialog.deductForm.formData.timeLimit"-->
<!--                                     disabled/>-->
<!--                    <span>&nbsp;{{-->
<!--                        settingDialog.deductForm.countTypeList[settingDialog.deductForm.formData.countType]-->
<!--                      }}</span>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--              </el-row>-->

<!--              <el-row>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="小于" prop="gtTimesLimit">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="0"-->
<!--                                     v-model="settingDialog.deductForm.formData.gtTimesLimit"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="次，每次扣款" label-width="120px" prop="glDeduct">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="2"-->
<!--                                     v-model="settingDialog.deductForm.formData.glDeduct"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="1" :offset="1"><span>&nbsp;&nbsp;&nbsp;元</span></el-col>-->
<!--              </el-row>-->

<!--              <el-row>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="大于">-->
<!--                    <el-input-number :controls="false"-->
<!--                                     v-model="settingDialog.deductForm.formData.gtTimesLimit" disabled/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="9">-->
<!--                  <el-form-item label="次，每次扣款" label-width="120px" prop="ggDeduct">-->
<!--                    <el-input-number :min="1" :controls="false" :precision="2"-->
<!--                                     v-model="settingDialog.deductForm.formData.ggDeduct"-->
<!--                                     :disabled="settingDialog.deductForm.formData.status===0"/>-->
<!--                  </el-form-item>-->
<!--                </el-col>-->
<!--                <el-col :span="1" :offset="1"><span>&nbsp;&nbsp;&nbsp;元</span></el-col>-->
<!--              </el-row>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="备注">-->
<!--              <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}"-->
<!--                        v-model.trim="settingDialog.deductForm.formData.remark"-->
<!--                        :disabled="settingDialog.deductForm.formData.status===0"-->
<!--                        maxlength="100"-->
<!--                        show-word-limit style="width:50%"/>-->
<!--            </el-form-item>-->

<!--          </el-form>-->
<!--        </el-tab-pane>-->
<!--        <el-tab-pane label="加班设置" name="overtime">-->
<!--          <el-form ref="overtimeForm" label-width="100px" size="mini" :model="settingDialog.overtimeForm.formData"-->
<!--                   :rules="settingDialog.overtimeForm.rules">-->
<!--            <el-form-item label="加班类型" prop="typeId">-->
<!--              <el-select v-model="settingDialog.overtimeForm.formData.typeId" style="width:38%"-->
<!--                         @change="changeOvertimeType">-->
<!--                <el-option v-for="(item,index) in settingDialog.overtimeForm.overtimeTypeList" :key="index"-->
<!--                           :value="item.id"-->
<!--                           :disabled="item.status===0"-->
<!--                           :label="item.name"/>-->
<!--              </el-select>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="状态">-->
<!--              <el-switch v-model="settingDialog.overtimeForm.formData.status"-->
<!--                         :disabled="settingDialog.overtimeForm.disabled"-->
<!--                         active-color="#13ce66"-->
<!--                         inactive-color="#ff4949"-->
<!--                         active-text="启用"-->
<!--                         inactive-text="禁用"-->
<!--                         :active-value="1"-->
<!--                         :inactive-value="0"/>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="计数类型">-->
<!--              <el-radio-group v-model="settingDialog.overtimeForm.formData.countType"-->
<!--                              :disabled="settingDialog.overtimeForm.formData.status===0">-->
<!--                <el-radio v-for="(item,index) in settingDialog.overtimeForm.countTypeList" :key="index"-->
<!--                          :label="index">{{ item }}-->
<!--                </el-radio>-->
<!--              </el-radio-group>-->
<!--            </el-form-item>-->
<!--            &lt;!&ndash; 只有休息日加班，公司才能选择是否补休 &ndash;&gt;-->
<!--            <el-form-item label="是否补休" v-if="settingDialog.overtimeForm.overtimeType.code === 'day_off_overtime'">-->
<!--              <el-radio-group v-model="settingDialog.overtimeForm.formData.timeOffFlag"-->
<!--                              :disabled="settingDialog.overtimeForm.formData.status===0" @change="changeTimeOff">-->
<!--                <el-radio :label="0">不调休</el-radio>-->
<!--                <el-radio :label="1">调休</el-radio>-->
<!--              </el-radio-group>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="工资倍数" prop="salaryMultiple">-->
<!--              <el-input-number v-model="settingDialog.overtimeForm.formData.salaryMultiple" :controls="false"-->
<!--                               :precision="1"-->
<!--                               style="width:38%"-->
<!--                               :disabled="settingDialog.overtimeForm.formData.status===0"/>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="加班奖金">-->
<!--              <el-input-number v-model="settingDialog.overtimeForm.formData.bonus"-->
<!--                               :controls="false"-->
<!--                               style="width:38%"-->
<!--                               :precision="2"-->
<!--                               :disabled="settingDialog.overtimeForm.formData.status===0"/>-->
<!--            </el-form-item>-->
<!--            <el-form-item label="备注">-->
<!--              <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}"-->
<!--                        v-model.trim="settingDialog.overtimeForm.formData.remark"-->
<!--                        :disabled="settingDialog.overtimeForm.formData.status===0"-->
<!--                        maxlength="100"-->
<!--                        show-word-limit style="width:50%"/>-->
<!--            </el-form-item>-->
<!--          </el-form>-->
<!--        </el-tab-pane>-->
      </el-tabs>
      <div slot="footer" class="dialog-footer">
        <el-button @click="settingDialog.isShow = false">取消</el-button>
        <el-button type="primary" @click="saveSetting">保存</el-button>
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
        <el-button type="warning" v-if="data.obj.parentId === 0" @click="handleSubAdd(data)">新增部门 <i
          class="el-icon-circle-plus-outline"/></el-button>
        <el-button type="info" v-if="data.obj.parentId !== 0" @click="handleSetting(data.obj)">考勤设置 <i
          class="el-icon-setting"/></el-button>
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
} from '../../../api/dept'

import {
  getOne, setWorkTime
} from '../../../api/workTime'

import {
  getAll
} from '../../../api/leaveType'

import {
  getLeave, setLeave
} from '../../../api/leave'

import {
  getAll as getAllDeductTypes
} from '../../../api/deductType'

import {
  getSalaryDeduct, setSalaryDeduct
} from "../../../api/salaryDeduct"

import {
  getAll as getAllOvertimeTypes
} from "../../../api/overtimeType"

import {
  getOvertime, setOvertime
} from "../../../api/overtime";

export default {
  name: 'Department',
  components: {
    CommonForm,
    CommonTable
  },
  data() {
    let checkSalaryMultiple = (rule, value, callback) => {
      if (this.settingDialog.overtimeForm.formData.timeOffFlag === 0) {
        if (this.settingDialog.overtimeForm.overtimeType.code !== "day_off_overtime") {
          if (value < this.settingDialog.overtimeForm.overtimeType.lowerLimit) {
            callback(new Error("根据劳动法规定，" + this.settingDialog.overtimeForm.overtimeType.name + "工资不能低于员工当前月平均" +
              this.settingDialog.overtimeForm.countTypeList[this.settingDialog.overtimeForm.formData.countType].name + "薪的" +
              this.settingDialog.overtimeForm.overtimeType.lowerLimit + "倍"))
          } else {
            callback()
          }
        } else {
          if (value < this.settingDialog.overtimeForm.overtimeType.lowerLimit) {
            callback(new Error("根据劳动法规定，在休息日加班且不安排补休的情况下，加班工资不能低于员工当前月平均" +
              this.settingDialog.overtimeForm.countTypeList[this.settingDialog.overtimeForm.formData.countType].name + "薪的" +
              this.settingDialog.overtimeForm.overtimeType.lowerLimit + "倍"))
          } else {
            callback()
          }
        }
      } else {
        callback()
      }
    }
    return {
      dialogForm: {
        type: 'add', // add为新增，edit为编辑
        isShow: false,
        formItemList: [
          {
            name: 'name',
            label: '名称',
            type: 'input'
          },
          {
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
      table: {
        tableData: [],
        tableLabel: [
          {
            name: 'name',
            label: '名称'
          },
          {
            name: 'createTime',
            label: '成立时间',
          },
          {
            name: 'morStartTime',
            label: '上午上班时间'
          },
          {
            name: 'morEndTime',
            label: '上午下班时间'
          },
          {
            name: 'aftStartTime',
            label: '下午上班时间'
          },
          {
            name: 'aftEndTime',
            label: '下午下班时间'
          },
          {
            name: 'totalWorkTime',
            label: '工作时长（h）'
          },
          {
            name: 'remark',
            label: '备注',
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
      settingDialog: {
        isShow: false,
        workTimeForm: {
          morning: {
            startOption: {
              start: '06:00',
              step: '00:10',
              end: '09:30'
            },
            endOption: {
              start: '10:00',
              step: '00:10',
              end: '12:30'
            }
          },
          afternoon: {
            startOption: {
              start: '13:00',
              step: '00:10',
              end: '15:00'
            },
            endOption: {
              start: '16:30',
              step: '00:10',
              end: '23:59'
            }
          },
          formData: {},
          rules: {
            morStartTime: [{
              required: true, message: '请选择开始时间', trigger: 'blur'
            }],
            morEndTime: [{
              required: true, message: '请选择结束时间', trigger: 'blur'
            }],
            aftStartTime: [{
              required: true, message: '请选择开始时间', trigger: 'blur'
            }],
            aftEndTime: [{
              required: true, message: '请选择开始时间', trigger: 'blur'
            }]
          }
        },
        leaveForm: {
          disabled: true,
          formData: {},
          rules: {
            typeId: [{
              required: true, message: '请选择请假类型', trigger: 'change'
            }],
            days: [{
              required: true, message: '请选择休假天数', trigger: 'blur'
            }]
          },
          leaveTypeList: []
        },
        deductForm: {
          countTypeList: ['分钟', '小时', '天'],
          disabled: true,
          formData: {countType: 0},
          rules: {
            typeId: [{
              required: true, message: '请选择扣款类型', trigger: 'change'
            }],
            timeLimit: [{
              required: true, message: '请输入时间', trigger: 'blur'
            }],
            ltTimesLimit: [{
              required: true, message: '请输入次数', trigger: 'blur'
            }],
            llDeduct: [{
              required: true, message: '请输入扣款金额', trigger: 'blur'
            }],
            lgDeduct: [{
              required: true, message: '请输入扣款金额', trigger: 'blur'
            }],
            gtTimesLimit: [{
              required: true, message: '请输入次数', trigger: 'blur'
            }],
            glDeduct: [{
              required: true, message: '请输入扣款金额', trigger: 'blur'
            }],
            ggDeduct: [{
              required: true, message: '请输入扣款金额', trigger: 'blur'
            }],
          },
          deductTypeList: []
        },
        overtimeForm: {
          overtimeType: {},
          overtimeTypeList: [],
          countTypeList: ['时', '日'],
          formData: {countType: 0, timeOffFlag: 0},
          disabled: true,
          rules: {
            typeId: [{
              required: true, message: '请选择加班类型', trigger: 'change'
            }],
            salaryMultiple: [
              {required: true, message: '请输入工资倍数', trigger: 'blur'},
              {validator: checkSalaryMultiple, type: 'number', trigger: 'blur'}]
          }
        },
        activeTabName: 'workTime',
        activeTabLabel: '出勤设置'
      },
      deptId: Number
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
    changeTimeOff(flag) {
      if (flag === 1) {
        this.settingDialog.overtimeForm.formData.bonus = 0
        this.settingDialog.overtimeForm.formData.salaryMultiple = 0
      }
    },
    changeOvertimeType(id) {
      this.$refs.overtimeForm.clearValidate()
      this.settingDialog.overtimeForm.disabled = false
      this.settingDialog.overtimeForm.overtimeType = this.settingDialog.overtimeForm.overtimeTypeList.find(item => item.id === id)
      getOvertime(this.deptId, id).then(response => {
        if (response.code === 200) {
          this.settingDialog.overtimeForm.formData = response.data
        } else {
          this.settingDialog.overtimeForm.formData = {
            typeId: id,
            countType: 0,
            timeOffFlag: 0,
            status: 0
          }
        }
      })
    },
    changeDeductType(id) {
      this.$refs.deductForm.clearValidate()
      this.settingDialog.deductForm.disabled = false
      getSalaryDeduct(this.deptId, id).then(response => {
        if (response.code === 200) {
          this.settingDialog.deductForm.formData = response.data
        } else {
          this.settingDialog.deductForm.formData = {
            typeId: id,
            countType: 0,
            status: 0
          }
        }
      })
    },
    changeLeaveType(id) {
      this.$refs.leaveForm.clearValidate()
      this.settingDialog.leaveForm.disabled = false
      getLeave(this.deptId, id).then(response => {
        if (response.code === 200) {
          this.settingDialog.leaveForm.formData = response.data
        } else {
          this.settingDialog.leaveForm.formData = {typeId: id, status: 0}
        }
      })
    },
    saveSetting() {
      if (this.settingDialog.activeTabName === 'workTime') {
        this.settingDialog.workTimeForm.formData.deptId = this.deptId;
        this.$refs.workTimeForm.validate(valid => {
          if (valid) {
            setWorkTime(this.settingDialog.workTimeForm.formData).then(response => {
              if (response.code === 200) {
                this.$message.success("保存成功")
                this.loading()
              } else {
                this.$message.error("保存失败")
              }
            })
          } else {
            return false
          }
        })
      } else if (this.settingDialog.activeTabName === 'leave') {
        this.settingDialog.leaveForm.formData.deptId = this.deptId
        this.$refs.leaveForm.validate(valid => {
          if (valid) {
            setLeave(this.settingDialog.leaveForm.formData).then(response => {
              if (response.code === 200) {
                this.$message.success("保存成功")
              } else {
                this.$message.error("保存失败")
              }
            })
          } else {
            return false
          }
        })
      } else if (this.settingDialog.activeTabName === 'deduct') {
        this.settingDialog.deductForm.formData.deptId = this.deptId
        this.$refs.deductForm.validate(valid => {
          if (valid) {
            setSalaryDeduct(this.settingDialog.deductForm.formData).then(response => {
              if (response.code === 200) {
                this.$message.success("保存成功")
              } else {
                this.$message.error("保存失败")
              }
            })
          } else {
            return false
          }
        })
      } else {
        this.settingDialog.overtimeForm.formData.deptId = this.deptId
        this.$refs.overtimeForm.validate(valid => {
          if (valid) {
            setOvertime(this.settingDialog.overtimeForm.formData).then(response => {
              if (response.code === 200) {
                this.$message.success("保存成功")
              } else {
                this.$message.error("保存失败")
              }
            })
          } else {
            return false
          }
        })
      }
    },
    clickTab(tab) {
      this.settingDialog.activeTabLabel = tab.label
      if (this.settingDialog.activeTabName === 'leave') {
        this.getAllLeaveType()
      } else if (this.settingDialog.activeTabName === 'deduct') {
        this.getAllDeductType()
      } else if (this.settingDialog.activeTabName === 'overtime') {
        this.getAllOvertimeType()
      }
    },
    handleSetting(obj) {
      this.deptId = obj.id
      this.settingDialog.isShow = true
      if (this.settingDialog.activeTabName === 'workTime') {
        this.settingDialog.workTimeForm.formData = {}
        if (obj.workTimeId != null) {
          getOne(obj.workTimeId).then(response => {
            if (response.code === 200) {
              this.settingDialog.workTimeForm.formData = response.data
            }
          })
        }
      } else if (this.settingDialog.activeTabName === 'leave') {
        this.settingDialog.leaveForm.formData = {}
        this.getAllLeaveType()
      } else if (this.settingDialog.activeTabName === 'deduct') {
        this.settingDialog.deductForm.formData = {}
        this.getAllDeductType()
      } else {
        this.settingDialog.overtimeForm.formData = {}
        this.getAllOvertimeType()
      }
    },
    getAllOvertimeType() {
      getAllOvertimeTypes().then(response => {
        if (response.code === 200) {
          this.settingDialog.overtimeForm.overtimeTypeList = response.data
        } else {
          this.$message.error("获取数据失败！")
        }
      })
    },
    getAllDeductType() {
      getAllDeductTypes().then(response => {
        if (response.code === 200) {
          this.settingDialog.deductForm.deductTypeList = response.data
        } else {
          this.$message.error("获取数据失败！")
        }
      })
    },
    getAllLeaveType() {
      getAll().then(response => {
        if (response.code === 200) {
          this.settingDialog.leaveForm.leaveTypeList = response.data
        } else {
          this.$message.error("获取数据失败！")
        }
      })
    }
    ,
    // 点击新增按钮，弹出对话框
    handleAdd() {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {}
    }
    ,
    handleSubAdd(data) {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'add'
      this.dialogForm.formData = {parentId: data.obj.id}
    }
    ,
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
    }
    ,
    handleDeleteBatch() {
      deleteBatch(this.ids).then(response => {
        if (response.code === 200) {
          this.$message.success("批量删除成功！")
          this.loading()
        } else {
          this.$message.error("批量删除失败！")
        }
      })
    }
    ,
    handleEdit(row) {
      this.dialogForm.isShow = true
      this.dialogForm.type = 'edit'
      this.dialogForm.formData = {id:row.id,name:row.name,remark:row.remark}
    }
    ,
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
    }
    ,
    search() {
      this.loading()
    }
    ,
    // 重置搜索表单
    reset() {
      this.searchForm.formData.name = ""
      this.loading()
    }
    ,
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
    }
    ,
    // 导出数据
    exportData() {
      window.open(getExportApi())
    }
    ,
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
