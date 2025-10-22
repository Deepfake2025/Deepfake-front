<script setup>
    //导入组件
    import VideoUploadCard from '@/components/VideoUploadCard.vue';
    import { ElSteps,ElStep } from 'element-plus';
import { ref } from 'vue';
    let active=ref(0)
</script>
<template>
    <div class="all">
        <div class="backCard">
            <p class="title">深度伪造检测</p>
            <p class="secondTitle">检测上传的视频是否是伪造的</p>
            <div class="functionPart">
                <div class="gudiePart">
                    <el-steps style="width: 80%;" :active="active"  finish-status="success">
                        <el-step title="上传文件" style="color: black;">

                        </el-step>
                         <el-step title="" >
                            <template #title>
                                <p style="color: black;">检测文件</p>
                            </template>
                         </el-step>
                         <el-step >
                             <template #title>
                                <p style="color: black;">获得检测结果</p>
                            </template>
                         </el-step>

                    </el-steps>
                </div>
                <video-upload-card class="detectCard"></video-upload-card>
            </div>
        </div>
    </div>
</template>
<style scoped>
    .all{
        display: flex;
        width: 100%;
        height: 100%;
        justify-content: center;
    }
    .backCard{
        width: 90%;
        height: 100%;
        background-color:#409EFF;
        display: flex;
        align-items: center;
        flex-direction: column;
    }
    .title{
        font-size: 50px;
        padding-top: 25px;
        color: white;
        font-weight: 600;
    }
    .secondTitle{
        font-size: 20px;
        padding-bottom: 25px;
         color: white;
    }
    .functionPart{
        width: 80%;
        height: 80%;
        border-radius: 2cap;
        background-color:#79BBFF;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .detectCard{
        width: 80%;
        height: 80%;
        border-radius: 2cap;
    }
    .gudiePart{
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>