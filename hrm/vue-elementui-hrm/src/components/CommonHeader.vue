<template>
  <header>
    <div class="l-content">
      <el-button
        plain
        @click="collapseMenu"
        icon="el-icon-menu"
        size="mini"
      ></el-button>
    </div>
    <div class="r-content">
      <el-dropdown trigger="hover" size="mini" @command="handleCommand">
        <span>
          <img :src="downloadApi+InfoForm.formData.avatar" alt="" class="avatar"/>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="showInfo">个人中心</el-dropdown-item>
          <el-dropdown-item command="editPwd">修改密码</el-dropdown-item>
          <el-dropdown-item command="leave">请假</el-dropdown-item>
          <el-dropdown-item command="logout">退出</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <el-dialog
      title="个人信息"
      :visible.sync="InfoForm.isShow"
    >
      <CommonForm
        :formItemList="InfoForm.formItemList"
        :formData="InfoForm.formData"
        :inline="InfoForm.inline"
      ></CommonForm>

      <div slot="footer" class="dialog-footer">
        <el-button @click="InfoForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirmInfo">确定</el-button>
      </div>
    </el-dialog>

    <el-dialog
      title="修改密码"
      :visible.sync="pwdForm.isShow"
    >
      <CommonForm ref="pwdForm"
                  :formItemList="pwdForm.formItemList"
                  :formData="pwdForm.formData"
                  :inline="pwdForm.inline"
                  :rules="pwdForm.rules"
      ></CommonForm>

      <div slot="footer" class="dialog-footer">
        <el-button @click="pwdForm.isShow = false">取消</el-button>
        <el-button type="primary" @click="confirmPwd">确定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="请假" :visible.sync="leaveForm.isShow">
      <el-tabs type="border-card" value="leave" @tab-click="clickTab">
        <el-tab-pane label="请假" name="leave">
          <el-form ref="leaveForm" label-width="100px" size="mini" :model="leaveForm.formData"
                   :rules="leaveForm.rules">
            <el-form-item label="假期类型" prop="typeId">
              <el-select v-model="leaveForm.formData.typeId" style="width:38%">
                <el-option v-for="(item,index) in leaveForm.leaveTypeList" :key="index" :value="item.typeId"
                           :disabled="item.status === 0"
                           :label="item.name"/>
              </el-select>
            </el-form-item>
            <el-form-item label="起始日期" prop="startDate">
              <el-date-picker v-model="leaveForm.formData.startDate" :pickerOptions="leaveForm.pickerOptions"/>
            </el-form-item>
            <el-form-item label="请假天数" prop="days">
              <el-input-number v-model="leaveForm.formData.days" :min="1" style="width:38%" step-strictly/>
            </el-form-item>
            <el-form-item label="备注">
              <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 4}"
                        v-model.trim="leaveForm.formData.remark"
                        maxlength="100"
                        show-word-limit style="width:50%"/>
            </el-form-item>
            <el-form-item>
              <div style="text-align:center">
                <el-button @click="leaveForm.isShow = false" style="margin-right:10px">取消</el-button>
                <el-button type="primary" @click="applyLeave" style="margin-left: 10px">确定</el-button>
              </div>
            </el-form-item>
          </el-form>
        </el-tab-pane>
        <el-tab-pane label="请假记录" name="records">
          <div class="common-table">
            <el-table :data="table.tableData" border
                      height="240px"
                      stripe
                      row-key="id"
                      :header-cell-style="{ background: '#eef1f6',color: '#606266',
      textAlign:'center',fontWeight:'bold',borderWidth:'3px'}">
              <el-table-column label="类型" prop="typeName" min-width="50px"/>
              <el-table-column label="起始日期" prop="startDate" min-width="50px"/>
              <el-table-column label="天数" prop="days" min-width="50px"/>
              <el-table-column label="审核状态" min-width="50px">
                <template slot-scope="scope">
                  <el-tag :type="leaveForm.tagType[scope.row.status]">{{
                      scope.row.status
                    }}
                  </el-tag>
                </template>
              </el-table-column>
              <el-table-column label="备注" prop="remark" min-width="120px"/>
              <el-table-column label="操作" min-width="60px">
                <template slot-scope="scope">
                  <el-button v-if="scope.row.status==='未审核'" size="mini" type="primary" @click="cancel(scope.row)"
                  >撤销 <i class="el-icon-scissors"></i
                  ></el-button>
                  <el-button v-if="scope.row.status!=='未审核'" size="mini" type="danger" @click="handleDelete(scope.row)"
                  >删除 <i class="el-icon-brush"></i
                  ></el-button>
                </template>
              </el-table-column>
            </el-table>
            <el-pagination
              style="margin-top: 10px;float: right"
              layout="total,sizes,prev,pager,next,jumper"
              :page-size="table.pageConfig.size ? table.pageConfig.size : 10"
              :page-sizes="[5, 10, 15, 20]"
              :total="table.pageConfig.total"
              :current-page.sync="table.pageConfig.current"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
            ></el-pagination>
          </div>
        </el-tab-pane>
      </el-tabs>
    </el-dialog>
  </header>
</template>
<script>
import CommonForm from './CommonForm'
import {edit, checkPassword, updatePassword} from "../api/staff";
import {getUploadApi} from "../api/docs";
import {getLeaveBydeptId} from "../api/leave";
import {add, getListByStaffId, deleteOne, edit as editLeave, getUnauditedByStaffId} from "../api/staffLeave"
import {getDownloadApi} from "../api/docs";


export default {
  name: 'CommonHeader',
  components: {
    CommonForm
  },
  data() {
    // 检查密码是否正确
    let checkPwd = (rule, value, callback) => {
      checkPassword(value, this.staff.id).then(
        response => {
          if (response.code === 200) {
            callback()
          } else {
            callback(new Error("密码输入错误！"))
          }
        }
      )
    }
    let checkNewPwd = (rule, value, callback) => {
      if (value === this.pwdForm.formData.password) {
        callback(new Error("不能使用近期的密码！"))
      } else {
        callback()
      }
    }
    // 检查密码是否一致
    let checkConfirmPwd = (rule, value, callback) => {
      if (value !== this.pwdForm.formData.newPassword) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback();
      }
    }
    let checkDays = (rule, value, callback) => {
      let leaveType = this.leaveForm.leaveTypeList.find(item => item.typeId === this.leaveForm.formData.typeId)
      if (value > leaveType.days) {
        callback(new Error('部门规定，' + leaveType.name + '休假天数不超过' + leaveType.days + '天!'))
      } else {
        callback();
      }
    }
    return {
      staff: JSON.parse(localStorage.getItem("staff")),
      InfoForm: {
        isShow: false,
        inline: false,
        formData: JSON.parse(localStorage.getItem("staff")),
        formItemList: [
          {
            name: 'avatar',
            label: '头像',
            type: 'upload',
            uploadUrl: getUploadApi(), // 上传文件的接口
            headers: this.headers // 携带的头部数据
          },
          {
            name: 'name',
            label: '姓名',
            type: 'input',
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
        ]
      },
      pwdForm: {
        isShow: false,
        inline: false,
        formData: {},
        formItemList: [
          {
            name: 'password',
            label: '原密码',
            type: 'password',
          },
          {
            name: 'newPassword',
            label: '新密码',
            type: 'password',
          },
          {
            name: 'confirmPassword',
            label: '确认密码',
            type: 'password',
          },
        ],
        rules: {
          password: [
            {required: true, message: '请输入原密码', trigger: 'blur'},
            {min: 3, max: 10, message: '长度在3到10个字符', trigger: 'blur'},
            {validator: checkPwd, trigger: 'blur'}
          ],
          newPassword: [
            {required: true, message: '请输入新密码', trigger: 'blur'},
            {min: 3, max: 10, message: '长度在3到10个字符', trigger: 'blur'},
            {validator: checkNewPwd, trigger: 'blur'}
          ],
          confirmPassword: [
            {required: true, message: '请输入确认密码', trigger: 'blur'},
            {min: 3, max: 10, message: '长度在3到10个字符', trigger: 'blur'},
            {validator: checkConfirmPwd, trigger: 'blur'}
          ]
        }
      },
      leaveForm: {
        isShow: false,
        inline: false,
        formData: {},
        tagType: {
          "未审核": "info",
          "审核通过": "success",
          "驳回": "danger",
          "撤销": "warning"
        },
        leaveTypeList: [],
        pickerOptions: { // 不能选择今天之前的日期
          disabledDate(time) {
            return time.getTime() < Date.now() - 24 * 60 * 60 * 1000
          }
        },
        rules: {
          typeId: [
            {required: true, message: '请选择', trigger: 'change'},
          ],
          startDate: [
            {required: true, message: '请选择开始日期', trigger: 'blur'}
          ],
          days: [
            {required: true, message: '请输入请假天数', trigger: 'blur'},
            {validator: checkDays, trigger: 'blur'}
          ]
        }
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
    downloadApi() {
      return getDownloadApi()
    },
    headers() {
      return {token: localStorage.getItem("token")}
    }
  },
  methods: {
    handleDelete(row) {
      deleteOne(row.id).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.success("删除成功")
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    cancel(row) {
      editLeave({id: row.id, status: '撤销'}).then(response => {
        if (response.code === 200) {
          this.loading()
          this.$message.success("撤销成功")
        } else {
          this.$message.error("撤销失败")
        }
      })
    },
    clickTab(obj) {
      if (obj.name === "records") {
        this.loading()
      }
    },
    // 请假
    applyLeave() {
      // 当有假期未被审核时，不得请假
      getUnauditedByStaffId(this.staff.id).then(response => {
        if (response.code === 200) {
          this.$message.error("你有未审批的休假申请，目前不能请假！")
        } else {
          this.$refs.leaveForm.validate(valid => {
            if (valid) {
              this.leaveForm.formData.staffId = this.staff.id
              add(this.leaveForm.formData).then(response => {
                if (response.code === 200) {
                  this.$message.success("提交成功！")
                } else {
                  this.$message.error("提交失败")
                }
              })
            } else {
              return false
            }
          })
        }
      })

    },
    // 全局控制侧边栏的展开
    collapseMenu() {
      this.$bus.$emit("collapseMenu")
    },
    handleCommand(command) {
      if (command === 'showInfo') {
        this.InfoForm.isShow = true
      } else if (command === 'editPwd') {
        this.pwdForm.isShow = true
      } else if (command === 'leave') {
        this.leaveForm.isShow = true
        this.getListByDeptId()
      } else {
        this.$message.success("退出登录成功！")
        this.$store.dispatch("staff/logout")
      }
    },
    getListByDeptId() {
      getLeaveBydeptId(this.staff.deptId).then(response => {
        if (response.code === 200) {
          this.leaveForm.leaveTypeList = response.data
        }
      })
    },
    confirmInfo() {
      edit(this.InfoForm.formData).then((response) => {
        if (response.code === 200) {
          localStorage.setItem("staff", JSON.stringify(this.InfoForm.formData)) // 更新用户信息到浏览器
          this.$message.success("修改成功！")
          this.InfoForm.isShow = false
          this.$bus.$emit("updateInfo", this.InfoForm.formData)
        } else {
          this.$message.error("修改失败！")
        }
      })
    },
    confirmPwd() {
      this.$refs.pwdForm.$refs.form.validate(valid => {
        if (valid) {
          updatePassword({id: this.staff.id, password: this.pwdForm.formData.newPassword}).then(
            response => {
              if (response.code === 200) {
                this.$message.success("密码修改成功，请重新登录！")
                this.$store.dispatch("staff/logout")
              } else {
                this.$message.error("密码修改失败！")
              }
            }
          )
        } else {
          return false
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
    loading() {
      getListByStaffId({
        current: this.table.pageConfig.current,
        size: this.table.pageConfig.size,
        id: this.staff.id
      }).then(response => {
        if (response.code === 200) {
          this.table.tableData = response.data.list
          this.table.pageConfig.total = response.data.total
        } else {
          this.$message.error(response.message)
        }
      })
    }
  },
  mounted() {
    this.$bus.$on('uploadSuccess', docs => {
      this.InfoForm.formData.avatar = docs.name
    })
  }, beforeDestroy() {
    this.$bus.$off("uploadSuccess")
  }
}
</script>
<style lang="less" scoped>
header {
  display: flex;
  height: 100%;
  justify-content: space-between;
  align-items: center;
}

.l-content {
  display: flex;
  align-items: center;

  .el-button {
    margin-right: 20px;
  }
}

.r-content {
  .avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
  }
}


.common-table {
  background-color: white;
  position: relative;
}
</style>
