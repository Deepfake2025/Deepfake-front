<script setup>
    import { ElCard,ElAvatar,ElButton,ElText,ElDivider} from 'element-plus';

</script>

<template>
    <ElCard class="card" shadow="hover">
        <template #header>
           <div class="center-container">
                 <ElAvatar class="avatar" shape="circle" src="https://ts1.tc.mm.bing.net/th/id/OIP-C.Y_K5zzMAmo3WTUDEmh4V4QHaDU?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3">
                </ElAvatar>
                <ElButton class="avatar-button" size="small">更换头像</ElButton>
           </div>
        </template>
       <div class="stats-container">
            <div class="stat-item">
                <ElText class="stat-number" type="primary">121</ElText>
                <ElText class="stat-label">检测次数</ElText>
            </div>
       </div>
    </ElCard>
</template>
<style scoped>
     .card{
        width: 100%;
        height: 100%;
        min-height: 400px;
     }
     .center-container {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        flex-direction: column;
        gap: 15px;
    }
    .avatar{
        width: 80px;
        height: 80px;
    }
    .avatar-button{
        background-color: #409EFF;
        color: white;
        border: none;
    }
    .avatar-button:hover {
        background-color: #66b1ff;
    }
    .stats-container {
        display: flex;
        flex-direction: column;
        gap: 15px;
        padding: 20px 0;
    }
    .stat-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 5px;
    }
    .stat-number {
        font-size: 24px;
        font-weight: bold;
    }
    .stat-label {
        font-size: 14px;
        color: #666;
    }
</style>