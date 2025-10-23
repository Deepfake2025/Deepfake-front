<script setup>
    import { ElText,ElButton } from 'element-plus';
import { useRouter } from 'vue-router';
    const router=useRouter()
    function beginDetect(){
        router.push("/AudioDetect")
    }
    function toDetect(route){
        router.push(route)
    }

</script>
<template>
    <div class="all">
        <div class="container">
            <div class="head center-container">
               <!--
                 <div class="Contentcard" style="background-color:#ECF5FF ;opacity: 50%;">
                    <el-icon size="50px"><Search /></el-icon>
                    <ElText class="cardText">
                    </ElText>
                </div>
               -->
                <el-icon size="50px"><Search /></el-icon>
                <ElText style="font-size: 70px;color: white;">
                    deepfake
                </ElText>
                <ElText  style="font-size: 30px;color: white;">
                    深度伪造检测系统
                </ElText>
            </div>
            <div class="main center-container">
                <ElText style="font-size: 45px;color: white;">
                    欢迎使用
                </ElText>
                <ElText  style="font-size: 20px;color: white;width: auto;" >
                    基于多模态融合的Deepfake检测平台
                </ElText>
                <ElText  style="font-size: 20px;color: white;width:auto;" >
                    输出人脸、人声伪造的概率
                </ElText>
            </div>
            <!-- 修改这里：使用flex布局让三个卡片完美居中 -->
            <div class="cards-container">
                <div class="Contentcard" @click="toDetect('/VideoDetect')">
                    <el-icon size="30px"><CircleCheck /></el-icon>
                    <ElText class="cardText" >
                        视频检测
                    </ElText>
                </div>
                <div class="Contentcard" @click="toDetect('/AudioDetect')">
                     <el-icon size="30px"><CircleCheck /></el-icon>
                    <ElText class="cardText"  >
                        音频检测
                    </ElText>
                </div>
                <div class="Contentcard" @click="toDetect('/ImageDetect')">
                     <el-icon size="30px"  ><CircleCheck /></el-icon>
                    <ElText class="cardText">
                        图片检测
                    </ElText>
                </div>
            </div>
            <ElButton class="detectButton" @click="beginDetect" >
              <ElText style="color: white;font-size: 20px;" >
                开始检测
                <el-icon><ArrowRight /></el-icon>
              </ElText>
            </ElButton>
        </div>
    </div>

</template>
<style scoped>
    .center-container {
        /* 使用flex布局实现居中 */
        display: flex;
        align-items: center;
        width: 100%;             /* 占满卡片头部宽度 */
        flex-direction: column;
    }
    .all{
        width: 100%;
        height: 100%;
    }
    .container{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .head{
        height: 30%;
        width: 100%;
    }
    .main{
        height: 25%;
    }
    
    /* 新增：三个卡片的容器样式 */
    .cards-container {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px; /* 卡片之间的间距 */
        width: 100%;
        height: 25%;
        margin-bottom: 20px;
    }
    
    .Contentcard{
        width: 200px; /* 固定宽度 */
        height: 120px; /* 固定高度 */
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        background-color: white;
        border-radius: 12px;
        cursor: pointer;
        transition: all 0.3s ease; /* 添加过渡效果 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 添加阴影 */
    }
     .Contentcard:hover{
       background-color:#ECF5FF;
       transform: translateY(-5px); /* 悬停时向上移动 */
       box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15); /* 悬停时增强阴影 */
     }
    .cardText{
        font-size: 20px;
        font-weight: 500;
        margin-top: 10px;
    }
    .foot{
        height: 20%;
    }
    .detectButton{
        width: 200px;
        height: 50px;
        background-color: #409EFF;
        border-color: #409EFF;
        border-radius: 2cap;
    }
</style>