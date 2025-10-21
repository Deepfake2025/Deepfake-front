<script setup>
    import { ElTable,ElTableColumn } from 'element-plus';
    //定义要展示的数据
    let tableData=[
        {
            detectId:'20050908',
            fileName:"hellow.jpg",
            fileType:"视频检查",
            detectState:"开始检测",
            detectTime:"2025-09-08-23:25:23",
            downloadPate:"https://ts1.tc.mm.bing.net/th/id/R-C.bf6039d03e94a1f571b52c5f5516fe8d?rik=MtHo7dDEXdSlLQ&riu=http%3a%2f%2fs1.doyo.cn%2fimgfile%2fbdgame%2f202005%2f15%2f1589515078_8.png&ehk=XA2R%2fbmvGZy22jUknAOt3ns8DuFptfo1fh%2byoFJ%2bzVo%3d&risl=&pid=ImgRaw&r=0"

        }
    ]
</script>
<template>
    <div class="dock">
        <div class="title">
            <p class="titleText">检测历史</p>
        </div>
        <ElTable :data="tableData" style="width: 100%;">
            <ElTableColumn prop="detectId" label="检测号"></ElTableColumn>
            <ElTableColumn prop="fileName" label="文件名称"></ElTableColumn>
            <ElTableColumn prop="fileType" label="文件类型"></ElTableColumn>
            <ElTableColumn prop="detectState" label="检测状态"></ElTableColumn>
            <ElTableColumn prop="detectTime" label="检测时间"></ElTableColumn>
            <ElTableColumn prop="downloadPate" label="源文件下载地址"></ElTableColumn>
        </ElTable>
    </div>

</template>
<style scoped>
    .dock{
        width: 100%;   
    }
    .title{
        background-color: white;
        display: flex;
        justify-content: center;
    }
    .titleText{
        font-size: 50px;
    }
</style>