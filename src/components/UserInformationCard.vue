<script setup>
    import { ElCard,ElAvatar,ElButton,ElText} from 'element-plus';

</script>

<template>
    <ElCard  class="card" shadow="hover">
        <template #header>
           <div class="center-container">
                 <ElAvatar  class="avatar"  shape="circle" src="https://ts1.tc.mm.bing.net/th/id/OIP-C.Y_K5zzMAmo3WTUDEmh4V4QHaDU?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3">
                </ElAvatar>
                <ElButton class="avatorButton">更换头像</ElButton>
           </div>
        </template>
       <div class="center-container">
            <ElText type="primary">121</ElText>
            <ElText>检测次数</ElText>
       </div>
    </ElCard>
</template>
<style scoped>
     .card{
        width: 100%;
     }
     .center-container {
        /* 使用flex布局实现居中 */
        display: flex;
        justify-content: center; /* 水平居中 */
        align-items: center;     /* 垂直居中 */
        width: 100%;             /* 占满卡片头部宽度 */
        flex-direction: column;
    }
    .avatar{
        width: 100px;
        height: 100px;
    }
    .avatorButton{
        background-color: #409EFF;
        color: white;
    }
</style>