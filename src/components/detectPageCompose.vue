<script setup>
    import { ElContainer,ElHeader,ElAside,ElMain,ElAvatar} from 'element-plus';
    import MenuCard from './MenuCard.vue';
</script>
<template>
    <div class="all">
        <ElContainer class="containerOne">
            <ElHeader class="headPart">
               <div class="headContainer">
                 <p class="title">
                    幻海识真
                </p>
                <ElAvatar  class="avatar"  shape="circle" src="https://ts1.tc.mm.bing.net/th/id/OIP-C.Y_K5zzMAmo3WTUDEmh4V4QHaDU?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3">
                </ElAvatar>
               </div>
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
    .headContainer{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }
    .headPart{
        width: 100%;
        height: 10%;
        background-color:#082852;
    }
    .avatar{
        width: 80px;
        height: 80px;
        margin: 10px;
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