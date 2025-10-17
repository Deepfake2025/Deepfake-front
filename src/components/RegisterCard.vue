<script setup>
    import { ElForm,ElFormItem,ElInput,ElButton, ElMessage } from 'element-plus';
import { ref } from 'vue';
    import { RouterLink, useRouter } from 'vue-router';
    //引入对接后端的api对象
    import api from '@/request/api';
    //获取注册数据
    let registerData=ref({
        email:"",
        password:"",
        confirmPassword:"",
    })
    const router=useRouter()
    //设置表单验证
    //设置一个变量获取ELFrom组件
    const Form=ref()
    //定义规则
    //先定义输入的两个密码要相同的规则
    const checkPassword=(rule,value,callback)=>{
        if(!value){
            //如果是空的先返回错误
            return callback(new Error("请再次输入密码"))
        }
        //检查前后输入的密码是否一致
        if(value==registerData.value.password){
           return callback()
        }else{
            return callback(new Error("前后密码不一致"))
        }

    }

    const rules=ref({
        email:[{
            required:true,//非空
            message:"请输入邮箱",
            trigger:"blur"//失去焦点时触发
        }],
        password:[{
            required:true,//非空
            message:"请输入密码",
            trigger:"blur"//失去焦点时触发
        }],
        confirmPassword:[{
            required:true,//非空
            message:"请再次输入密码",
            trigger:"blur"//失去焦点时触发
        },
        {
            validator:checkPassword,
            trigger:"blur"
        }
    ]
    })
    //注册函数
    async function registerFuction(fromEl){
        //获取数据
        console.log("注册时获取到的用户数据",registerData.value)
        await fromEl.validate((valid,fields)=>{
            if(valid){
                //输入合法实现跳转
                //向后端发送注册请求
                //先设置请求体数据
                const data={
                    "email":registerData.value.email,
                    "password":registerData.value.password
                }
                api.post("/auth/register",data).then(res=>{
                    console.log("获取到的注册数据是，",res)         //判断用户是否存在
                    //判断用户是否已经注册
                    if(res.data.code===0){
                        //此时用户注册成功，弹窗提示并跳转到登录页面
                        console.log("用户注册成功")
                        ElMessage({
                            message:"注册成功,返回登录界面",
                            duration:1000,
                        })
                        router.push("/Login")
                    }else if(res.data.code===401009){
                        console.log("用户名已经存在，注册失败")
                         ElMessage({
                            message:"用户名已经存在",
                            duration:1000,
                        })
                    }
                }).catch(err=>{
                    console.log("注册失败，错误是",err)
                })
            }else{
                console.log("error",fields)
            }
        })
    }
</script>
<template>
        <ElForm class="formCard" label-position="right" label-width="auto" :model="registerData" 
        ref="Form"  :rules="rules" >
            <p class="titlePart">
                注册
            </p>
             <ElFormItem label="邮箱" class="Item" prop="email">
                <ElInput v-model="registerData.email">

                </ElInput>
            </ElFormItem>
            <ElFormItem label="密码" class="Item" prop="password">
                <ElInput v-model="registerData.password">

                </ElInput>
            </ElFormItem>
             <ElFormItem label="确认密码"  class="Item" prop="confirmPassword">
                <ElInput v-model="registerData.confirmPassword">
                    
                </ElInput>
            </ElFormItem>
                <ElButton class="buttonPart" @click="registerFuction(Form)">
                    注册
                </ElButton>
                <RouterLink to="/Login"  class="link">返回登录</RouterLink>
        </ElForm>
</template>
<style scoped>
    .formCard{
        width:450px;
        height: 350px;
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
        width: 85%;
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