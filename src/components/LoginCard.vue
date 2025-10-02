<script setup>
    import { ElForm,ElFormItem,ElInput,ElButton } from 'element-plus';
    import { RouterLink } from 'vue-router';
</script>
<template>
        <ElForm class="formCard">
            <p class="titlePart">
                deepfake检测
            </p>
            <ElFormItem label="账号" class="Item">
                <ElInput>

                </ElInput>
            </ElFormItem>
             <ElFormItem label="密码"  class="Item">
                <ElInput>
                    
                </ElInput>
            </ElFormItem>
            <ElFormItem>
                <ElButton class="buttonPart">
                    登录
                </ElButton>
            </ElFormItem>
            <ElFormItem>
                <RouterLink to="/Register"  class="link">还未注册?点击注册</RouterLink>
            </ElFormItem>
        </ElForm>
</template>
<style scoped>
    .formCard{
        width:400px;
        height: 300px;
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
    .buttonPart{
        background-color: #097EFE;
        color: white;
        margin-top: 20px;
    }
    .link{
        color: #097EFE ;
        padding: 0px;
    }
    .link:hover{
        background-color: white;
        border-bottom: 1px solid  #097EFE ;
    }
</style>