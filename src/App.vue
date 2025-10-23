<script setup>
import {nextTick, onMounted, ref, watch } from 'vue';
import { RouterView, useRouter } from 'vue-router';
import authService from './utils/auth';
import api from './request/api';
import detectPageCompose from './components/detectPageCompose.vue';
    let show=ref(true)
    const router=useRouter()
    //监听路由变化，控制show的值
    watch(()=>router.currentRoute.value.path,(newPath)=>{
        //如果路由不是登录界面和注册界面
        console.log("当前的路由是",newPath)
        if(newPath!="/Login"&&newPath!="/Register"){
            show.value=false
        }else{
            show.value=true
        }
        console.log("改变后show的值",show.value)
    })
/*    //以下为自动登录的函数
    onMounted(()=>{
        nextTick(()=>{
            const data={
                "email":"754815896@qq.com",
                "password":"123456",
            }
            console.log("请求体的数据",data)
            api.post("/auth/login",data).then(res=>{
                console.log("获取到的登录数据是,",res)
                ElMessage({
                    message:"登录成功",
                    duration:1000,
                })
                console.log("此时的cookie是",document.cookie)
                router.push("/Home")
            }).catch(err=>{
                console.log('登录失败,错误是',err)
            })
        })
    }
    ) */
</script>
<template>
    <div class="all">
       <div class="LoginPart" v-show="show">
            <RouterView></RouterView>
       </div> 
       <div class="fuctionPart" v-show="!show">
            <detectPageCompose>
                <RouterView></RouterView>
            </detectPageCompose>
       </div>
    </div>
</template>
<style  scoped>
    .all{
        width: 100%;
        height: 100%;
    }
    .LoginPart{
        width: 100%;
        height: 100%;
        background-image: url(src/assets/background/pexels-orange-ocean-243774902-28770001.jpg);
        background-size: cover;
    }
    .fuctionPart{
        width: 100%;
        height: 100%;
        background-image: url(src/assets/background/pexels-bilge-celik-245699833-34113467.jpg);
        background-size: cover;
    }
</style>