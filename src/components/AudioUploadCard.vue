<script setup>
    //首先引入上传器组件
    import { ElUpload ,ElButton } from 'element-plus';
import { ref } from 'vue';
    //
    const filelist=ref([])
    // const timer=setInterval(()=>{
    //     //列举文件列表的内容
    //     console.log("文件列表的内容",filelist.value)
    // },3000)
</script>
<template>
   <div>
    <div class="headArea">
        <p class="headText">音频上传</p>
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
        >
            <!--设置提示-->
            <template #tip>
                <p class="tipText">
                    上传的文件的大小不可以超过200mb
                </p>
            </template>
            <!--设置选择文件的按钮-->
            <template #trigger>
                <ElButton>
                    选择文件
                </ElButton>
            </template>
            <!--向后端发送文件的按钮-->
            <ElButton class="deliverButton">
                上传文件
            </ElButton>
        </ElUpload>

    </div>
   </div>

</template>
<style scoped>
    .headArea{
        display: flex;
        justify-content: center;
        align-items: center;
        
    }
    .headText{
        color: black;
        font-size: 70px;
        padding: 100px;
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
    }
    ::v-deep .tipText{
        color: white !important;
    }
</style>