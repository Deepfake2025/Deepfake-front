<script setup>
    import { ElMenu,ElMenuItem,ElSubMenu } from 'element-plus';
    import { ArrowRight, ArrowDown } from '@element-plus/icons-vue'

// 定义带样式的图标组件
</script>
<template>
    <ElMenu  class="menu" background-color="#082852" router="true" >
        <ElMenuItem class="item" index="/Home">
            <el-icon><House /></el-icon>
            首页
        </ElMenuItem>
        <ElSubMenu class="subMenu" index="1">
           <template #title >
               <span class="subMenutitle">
                <el-icon><CircleCheck /></el-icon>
                可视化检测
                </span>
           </template>
            <ElMenuItem class="item" index="/VideoDetect">
                <el-icon><VideoCamera /></el-icon>
                视频检测
            </ElMenuItem >
            <ElMenuItem class="item" index="/AudioDetect">
                <el-icon><Microphone /></el-icon>
                音频检测
            </ElMenuItem >
        </ElSubMenu>
        <ElMenuItem class="item" index="/History">
            <el-icon><Histogram /></el-icon>
            检测历史
        </ElMenuItem>
        <ElMenuItem class="item" index="/UserCenter">
            <el-icon ><User  /></el-icon>
            个人中心
        </ElMenuItem>
    </ElMenu>
</template>
<style scoped>
    .menu{
        background-color:#082852;
    }
    .subMenu{
        background-color: #082852;
    }
    .subMenu:hover{
        color:aqua ;
    }
    .item{
        color: white;
        background-color: #082852;
    }
    .item:hover{
        color: aqua;
        background-color: #062042;
    }
    .subMenutitle{
        color: white;
    }
</style>