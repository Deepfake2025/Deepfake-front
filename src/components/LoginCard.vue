<script setup>
import api from '@/request/api';
import { ElForm,ElFormItem,ElInput,ElButton, ElMessage } from 'element-plus';
import {  ref } from 'vue';
import { RouterLink, useRouter } from 'vue-router';
import authService from '@/utils/auth';
    //设置从表单获取的数据的变量
    let loginData=ref({
        email:"",
        password:""
    })
    //下面函数实现登录跳转
    //设置表单验证
    const rules=ref({
        email:[{
            //写明要对邮箱验证的功能
            required:true,//非空
            message:"请输入邮箱",//设置验证失败输出结果
            trigger:"blur"//失去焦点时进行验证
        }],
        password:[{
            required:true,//非空
            message:"请输入密码",//设置验证失败输出结果
            trigger:"blur"//失去焦点时进行验证
        }]
    })
    //下面变量获取el-form组件示例，用于调用方法
    const From=ref()
    const router=useRouter()
    async function  LoginFuction(fromEl){
        //获取表单数据
        console.log("获取到的表单数据是：",loginData.value)
        //跳转到首页
        //调用组件对象的验证方法
        await fromEl.validate((valid,fields)=>{
            //获取表单验证结果后判断是否符合规则，决定是否提交
            if(valid){
                //如果验证成功发送请求
                console.log("验证成功")
                //接下来发送数据给后端，验证密码
                const data={
                    "email":loginData.value.email,
                    "password":loginData.value.password
                }
                console.log("请求体的数据",data)
                api.post("/auth/login",data).then(res=>{
                    console.log("获取到的登录数据是,",res)
                    ElMessage({
                        message:"登录成功",
                        duration:1000,
                    })
                    router.push("/Home")
                }).catch(err=>{
                    console.log('登录失败,错误是',err)
                })
            }else{
                console.log("error",fields)
            }
        })
       // router.push({path:"Home"})
    }
 
</script>
<template>
        <ElForm class="formCard" :rules="rules" ref="From" :model="loginData">
            <p class="titlePart">
                deepfake检测
            </p>
            <ElFormItem label="邮箱" class="Item" prop="email">
                <ElInput v-model="loginData.email">

                </ElInput>
            </ElFormItem>
             <ElFormItem label="密码"  class="Item" prop="password">
                <ElInput v-model="loginData.password" >
                    
                </ElInput>
            </ElFormItem>
            <ElFormItem>
                <ElButton class="buttonPart" @click="LoginFuction(From)">
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