<script setup>
    //首先引入上传器组件
    import { ElUpload ,ElButton } from 'element-plus';
import { ref } from 'vue';
import { useRouter } from 'vue-router';
    //
    const filelist=ref([])
    // const timer=setInterval(()=>{
    //     //列举文件列表的内容
    //     console.log("文件列表的内容",filelist.value)
    // },3000)

    // 检测文件函数
    function detectFile() {
        if (filelist.value.length === 0) {
            ElMessage.warning('请先选择要检测的文件');
            return;
        }
        
        // 模拟检测过程
        ElMessage.info('开始检测文件...');
        
        // 模拟检测延迟后跳转到结果页面
        setTimeout(() => {
            router.push('/DetectResult');
        }, 2000);
    }
</script>
<template>
   <div class="all">
    <div class="headArea">
        <p class="headText">视频上传</p>
    </div>
    <div class="uploadArea">
        <ElUpload
            v-model:file-list="filelist"
            :multiple="true"
            :auto-upload="false"
            class="uploadItem"
            ref="uploadRef"
            :with-credentials="true"
            :limit="1"
            :drag="true"
        >
            <!--设置提示-->
            <template #tip>
               <div class="center-container">
                     <p class="tipText">
                    上传的文件的大小不可以超过200mb
                    </p>
               </div>
            </template>
            <!--设置选择文件的按钮-->
            <template #trigger> 
                <div class="trigger">
                    拖拽或点击上传文件
                </div>
            </template>
            <!--向后端发送文件并检测的按钮-->
            <ElButton class="deliverButton" @click="detectFile" :disabled="filelist.length === 0">
                检测文件
            </ElButton>
        </ElUpload>

    </div>
   </div>

</template>
<style scoped>
     .center-container {
        /* 使用flex布局实现居中 */
        display: flex;
        justify-content: center; /* 水平居中 */
        align-items: center;     /* 垂直居中 */
        width: 100%;             /* 占满卡片头部宽度 */
        flex-direction: row;
    }
    .all{
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        background-color: #A0CFFF;
    }
    .headArea{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .headText{
        color: black;
        font-size: 70px;
        padding: 30px;
    }
    .uploadArea{
        display: flex;
        justify-content: center;
    }
    .uploadItem{
        display: flex;
        justify-content: center;
        flex-direction: column;
    }
    .deliverButton{
        width: 30%;
        margin-left: 35%;
        margin-bottom: 20px;
    }
    ::v-deep .tipText{
        color: white !important;
    }
    .trigger{
        width: 400px;
        height: 80px;
    }
</style>