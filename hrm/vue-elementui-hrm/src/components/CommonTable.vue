<template>
  <div class="common-table">
    <el-table
      :data="tableData"
      height="85%"
      border
      stripe
      row-key="id"
      :header-cell-style="{ background: '#eef1f6',color: '#606266',
      textAlign:'center',fontWeight:'bold',borderWidth:'3px'}"
      @selection-change="handleSelectionChange"
    >
      <el-table-column
        type="selection"
        width="50"
      >
      </el-table-column>
      <el-table-column
        show-overflow-tooltip
        v-for="(item, index) in tableLabel"
        :key="index"
        :prop="item.name"
        :label="item.label"
        :min-width="item.width ? item.width : 125"
      >
        <template slot-scope="scope">
          <span v-if="item.type === 'gender' ">{{ scope.row[item.name] ? '女' : '男' }}  </span>
          <el-switch v-model="scope.row[item.name]" v-else-if="item.type === 'switch' " style="display: block"
                     active-color="#13ce66"
                     inactive-color="#ff4949"
                     active-text="正常"
                     inactive-text="异常"
                     :active-value="1"
                     :inactive-value="0"
                     @change="handleStatusChange(scope.row)"
          ></el-switch>
          <span v-else>{{ scope.row[item.name] }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="280" fixed="right">
        <template slot-scope="scope">

          <el-button size="mini" type="primary" @click="edit(scope.row)"
          >编辑 <i class="el-icon-edit"></i
          ></el-button>
          <el-popconfirm
            style="margin-left:10px;margin-right:10px"
            confirm-button-text='确定'
            cancel-button-text='我再想想'
            icon="el-icon-info"
            icon-color="red"
            title="你确定删除吗？"
            @confirm="del(scope.row)"
          >
            <el-button size="mini" type="danger" slot="reference"
            >删除 <i class="el-icon-remove-outline"></i
            ></el-button>
          </el-popconfirm>
          <slot name="slot1" :obj="scope.row"></slot>
        </template>
      </el-table-column>

    </el-table>
    <el-pagination
      class="pager"
      layout="total,sizes,prev,pager,next,jumper"
      :page-size="pageConfig.size ? pageConfig.size : 10"
      :page-sizes="[5, 10, 15, 20]"
      :total="pageConfig.total"
      :current-page.sync="pageConfig.current"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    ></el-pagination>
  </div>
</template>
<script>

export default {
  name: 'CommonTable',
  props: {
    tableData: Array,
    tableLabel: Array,
    pageConfig: Object
  },
  data() {
    return {}
  },
  methods: {
    handleSizeChange(size) {
      this.$bus.$emit("sizeChange", size)
    },
    handleCurrentChange(current) {
      this.$bus.$emit("currentChange", current)
    },
    del(row) {
      this.$bus.$emit("del", row)
    },
    edit(row) {
      this.$bus.$emit("edit", row)
    },
    handleSelectionChange(val) {
      this.$bus.$emit("selectionChange", val)
    },
    handleStatusChange(row) {
      this.$bus.$emit("statusChange", row)
    }
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
