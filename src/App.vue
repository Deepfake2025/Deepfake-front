<script setup>
import {onMounted, ref, watch } from 'vue';
import { RouterView, useRouter } from 'vue-router';
import authService from './utils/auth';
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