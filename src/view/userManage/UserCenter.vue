<script setup>
    import UserinfromModifyCard from '@/components/UserinfromModifyCard.vue';
    import UserInformationCard from '@/components/UserInformationCard.vue';
    import { ElContainer,ElAside,ElMain } from 'element-plus';
</script>

<template>
    <div class="all">
        <el-container class="container">
            <el-main class="aside">
                <user-information-card class="cardOne"></user-information-card>
            </el-main>
            <el-main class="main">
                <UserinfromModifyCard class="cardTwo"></UserinfromModifyCard>
            </el-main>
        </el-container>
    </div>

</template>
<style scoped>
    .all{
        width: 100%;
        height: 100%;
       display: flex;
       justify-content: center;
    }
    .container{
        width: 100%;
        height: 100%;
    }
    .aside{
        width: 30%;
    }
    .main{
        width: 40%;
    }
    
</style>