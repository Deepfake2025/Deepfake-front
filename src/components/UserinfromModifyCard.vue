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
    }
</script>

<template>
    <ElCard class="card">
            <template #header>
                   <div class="head">
                        <ElText>个人信息</ElText>
                        <ElButton  class="button" @click="beginModify">
                          <p style="color: white;">修改信息</p>
                        </ElButton>
                   </div>
            </template>
            <ElForm class="formCard"  ref="From" :model="newUserData" label-position="right" label-width="auto" :disabled="!modifying">
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
            <div class="center-container" v-show="modifying">
                <ElButton class="button" @click="saveModifiy" ><p style="color: white;">保存</p></ElButton>
                <ElButton @click="cancelModify" ><p >取消</p></ElButton>
            </div>
    </ElCard>

</template>
<style scoped>
    .card{
        width: 100%;
        height: 50%;
    }
    .head{
        width: 100%;
        display:flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .button{
        background-color: #409EFF;
    }
    .formCard{
        width:100%;
        height: 100%;
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
      .center-container {
        /* 使用flex布局实现居中 */
        display: flex;
        justify-content: center; /* 水平居中 */
        align-items: center;     /* 垂直居中 */
        width: 100%;             /* 占满卡片头部宽度 */
        flex-direction: row;
    }
</style>