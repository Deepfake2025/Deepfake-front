<script setup>
    import { ElForm,ElFormItem,ElInput,ElButton, ElMessage } from 'element-plus';
    import {  ref } from 'vue';
    let newUserData=ref({
        userName:"",
        birth:"",
        email:"",
        password:"",
        phoneNumber:""
    })
</script>

<template>
    <ElForm class="formCard"  ref="From" :model="newUserData" label-position="right" label-width="auto">
            <p class="titlePart">
                个人信息修改
            </p>
            <ElFormItem label="用户名" class="Item" prop="userName">
                <ElInput v-model="newUserData.userName">

                </ElInput>
            </ElFormItem>
            <ElFormItem label="生日" class="Item" prop="birth">
                <ElInput v-model="newUserData.birth">

                </ElInput>
            </ElFormItem>
             <ElFormItem label="邮箱"  class="Item" prop="email">
                <ElInput v-model="newUserData.email" >
                    
                </ElInput>
            </ElFormItem>
            <ElFormItem label="密码" class="Item" prop="password">
                <ElInput v-model="newUserData.password">

                </ElInput>
            </ElFormItem>
            <ElFormItem label="电话" class="Item" prop="phoneNumber">
                <ElInput v-model="newUserData.phoneNumber">

                </ElInput>
            </ElFormItem>
    </ElForm>

</template>
<style scoped>
    .formCard{
        width:400px;
        height: 500px;
        background-color: white;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .titlePart{
        font-size:40px;
        padding-bottom: 20px;
        font-weight: 700;
        color: #097EFE;
    }
    .Item{
        padding: 10px;
        margin: 0;
        width: 80%;
    }
</style>