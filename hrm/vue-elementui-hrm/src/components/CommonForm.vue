<template>
  <el-form ref="form" label-width="auto" :rules="rules" :model="formData"
           :inline="inline" size="mini">
    <el-form-item
      v-for="(item, index) in formItemList"
      :key="index"
      :label="item.label"
      :prop="item.name"
    >
      <el-input
        v-if="item.type === 'input'"
        :placeholder="item.placeholder || '请输入' + item.label"
        v-model.trim="formData[item.name]"
        :prefix-icon="item.icon"
      />

      <el-input-number
        v-if="item.type === 'number'"
        :placeholder="item.placeholder || '请输入' + item.label" type="number"
        v-model="formData[item.name]"
        controls-position="right"
        :precision="item.precision || 3"
        :step="item.step"
        style="width:100%"
        :disabled="item.disabled || false"
      />

      <el-input
        v-if="item.type === 'password'"
        :placeholder="item.placeholder || '请输入' + item.label"
        v-model.trim="formData[item.name]"
        prefix-icon="el-icon-lock"
        show-password
      />

      <el-input v-if="item.type==='textarea'"
                type="textarea"
                :placeholder="item.placeholder || '请输入' + item.label"
                v-model.trim="formData[item.name]"
                :autosize="{ minRows: 2, maxRows: 4}"
                maxlength="100"
                show-word-limit
      />

      <el-upload v-if="item.type === 'upload'"
                 :action="item.uploadUrl" :headers="item.headers" :multiple="false" :on-success="handleUploadSuccess"
                 :limit="1"
                 list-type="picture-card">
        <i class="el-icon-plus"></i>
      </el-upload>

      <el-switch v-if="item.type === 'switch'" v-model="formData[item.name]"/>

      <el-date-picker
        v-if="item.type === 'date'"
        :type="item.inputType || 'date'"
        :value-format=" item.valueFormat  || 'yyyy-MM-dd'"
        :placeholder="item.placeholder || '请选择' + item.label"
        v-model="formData[item.name]"
      />

      <el-select
        v-if="item.type === 'select'"
        :placeholder="item.placeholder ||  '请选择' + item.label"
        v-model="formData[item.name]"
      >
        <el-option
          v-for="option in item.optionList"
          :key="option.id"
          :label="option.name"
          :value="option.id"
          :disabled="option.disabled"
        />
      </el-select>

    </el-form-item>
    <el-form-item>
      <slot></slot>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  name: 'CommonForm',
  props: {
    formItemList: Array,
    formData: Object,
    inline: Boolean,
    rules: Object
  },
  methods: {
    handleUploadSuccess(response) {
      if (response.code === 200) {
        this.$message.success("文件上传成功！")
        this.$bus.$emit('uploadSuccess', response.data)
      } else {
        this.$message.error("文件上传失败！")
      }
    }
  }
}
</script>

<style scoped>
</style>
