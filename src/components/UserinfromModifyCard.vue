<script setup>
    import { ElForm,ElFormItem,ElInput,ElButton, ElMessage,ElCard,ElText} from 'element-plus';
    import {  ref } from 'vue';
    let newUserData=ref({
        userName:"彼岸的诺亚",
        birth:"2025年1月1日",
        email:"12306@qq.com",
        password:"",
        phoneNumber:"110110110110"
    })
    //设置组件的功能变量
    let originUserData={}//临时存储表单数据
    let modifying=ref(false)//判断是否正在修改表单的变量
    //点击按钮
    function beginModify(){//进入修改状态的函数
        modifying.value=true//
        //用一个临时变量存起来现在的数据
        originUserData={...newUserData.value}
    }
    function cancelModify(){
        //将临时变量的数据放回表单数据
        newUserData.value={...originUserData}
        modifying.value=false
        //情空临时变量的数据
         originUserData={...{}}
        
    }
    function saveModifiy(){
        modifying.value=false
        ElMessage.success('信息保存成功！')
    }
</script>

<template>
    <ElCard class="card">
            <template #header>
                   <div class="head">
                        <ElText class="title">个人信息</ElText>
                        <ElButton class="modify-button" @click="beginModify" v-if="!modifying">
                          <p style="color: white;">修改信息</p>
                        </ElButton>
                   </div>
            </template>
            <ElForm class="form-card" ref="From" :model="newUserData" label-position="left" label-width="80px" :disabled="!modifying">
                <ElFormItem label="用户名" class="form-item" prop="userName">
                    <ElInput v-model="newUserData.userName" :disabled="!modifying">
                    </ElInput>
                </ElFormItem>
                <ElFormItem label="生日" class="form-item" prop="birth">
                    <ElInput v-model="newUserData.birth" :disabled="!modifying">
                    </ElInput>
                </ElFormItem>
                <ElFormItem label="邮箱" class="form-item" prop="email">
                    <ElInput v-model="newUserData.email" :disabled="!modifying">
                    </ElInput>
                </ElFormItem>
                <ElFormItem label="密码" class="form-item" prop="password">
                    <ElInput v-model="newUserData.password" type="password" :disabled="!modifying" placeholder="输入新密码">
                    </ElInput>
                </ElFormItem>
                <ElFormItem label="电话" class="form-item" prop="phoneNumber">
                    <ElInput v-model="newUserData.phoneNumber" :disabled="!modifying">
                    </ElInput>
                </ElFormItem>
          </ElForm>
            <div class="button-container" v-show="modifying">
                <ElButton class="save-button" @click="saveModifiy">
                    <p style="color: white;">保存</p>
                </ElButton>
                <ElButton class="cancel-button" @click="cancelModify">
                    <p>取消</p>
                </ElButton>
            </div>
    </ElCard>

</template>
<style scoped>
    .card{
        width: 100%;
        height: 100%;
        min-height: 400px;
    }
    .head{
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
    }
    .title {
        font-size: 20px;
        font-weight: 600;
        color: #333;
    }
    .modify-button{
        background-color: #409EFF;
        border: none;
    }
    .modify-button:hover {
        background-color: #66b1ff;
    }
    .form-card{
        width: 100%;
        padding: 20px 0;
    }
    .form-item{
        margin-bottom: 20px;
    }
    .button-container {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 20px;
    }
    .save-button{
        background-color: #67C23A;
        border: none;
    }
    .save-button:hover {
        background-color: #85ce61;
    }
    .cancel-button{
        background-color: #909399;
        color: white;
        border: none;
    }
    .cancel-button:hover {
        background-color: #a6a9ad;
    }
</style>