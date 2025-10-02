<script setup>
    import { ElContainer,ElHeader,ElAside,ElMain } from 'element-plus';
    import MenuCard from './MenuCard.vue';
</script>
<template>
    <div class="all">
        <ElContainer class="containerOne">
            <ElHeader class="headPart">
                <p class="title">
                    deepfake检测
                </p>
            </ElHeader>
            <ElContainer>
                <ElAside class="asidePart">
                    <MenuCard></MenuCard>
                </ElAside>
                <ElMain class="mainPart">
                    <slot></slot>
                </ElMain>
            </ElContainer>
        </ElContainer>
    </div>
</template>
<style scoped>
    .all{
        width: 100%;
        height: 100%;
    }
    .containerOne{
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }
    .headPart{
        width: 100%;
        height: 10%;
        background-color:#082852;
    }
    .asidePart{
        background-color:#082852 ;
        width: 15%;
        min-width: 200px
    }
    .title{
        font-size: 4vh;
        color: white;
        padding: 10px;
    }

</style>