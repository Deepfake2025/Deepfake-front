<script setup>
    import { ElText,ElButton } from 'element-plus';
import { useRouter } from 'vue-router';
    const router=useRouter()
    function beginDetect(){
        router.push("/AudioDetect")
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
                    基于深度学习的伪造检测系统
                </ElText>
                <ElText  style="font-size: 20px;color: white;width:auto;" >
                    可以告知文件是伪造的概率
                </ElText>
            </div>
            <div class="main center-container" style="flex-direction: row;justify-content: space-around;">
                <div class="Contentcard" style="margin-left: 5%;"  >
                    <el-icon size="30px"><CircleCheck /></el-icon>
                    <ElText class="cardText">
                        快速检测
                    </ElText>
                </div>
                <div class="Contentcard">
                     <el-icon size="30px"><CircleCheck /></el-icon>
                    <ElText class="cardText"  >
                        快速检测
                    </ElText>
                </div>
                <div class="Contentcard">
                     <el-icon size="30px"  ><CircleCheck /></el-icon>
                    <ElText class="cardText">
                        快速检测
                    </ElText>
                </div>
                <div class="Contentcard" style="margin-right: 5%;" >
                     <el-icon size="30px"><CircleCheck /></el-icon>
                    <ElText class="cardText">
                        快速检测
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
    .Contentcard{
        width: 20%;
        height: 80%;
        max-width: 250px;
        display: flex;
        align-items: center;
        justify-content: center;             /* 占满卡片头部宽度 */
        flex-direction: column;
        background-color: white;
        border-radius: 1cap;
    }
    .cardText{
        font-size: 25px;
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