<script setup>
    import { ElTable,ElTableColumn,ElTag,ElButton,ElCard } from 'element-plus';
    import { ref } from 'vue';
    
    //定义要展示的数据 - 与个人中心最近记录保持一致
    let tableData = ref([
        {
            detectId: 'DF20250108001',
            fileName: 'video_sample.mp4',
            fileType: '视频检测',
            detectState: '已完成',
            detectTime: '2025-01-08 14:30:25',
            result: '真实',
            resultType: 'success',
            probability: '真实概率：96.8%',
            fileSize: '15.2MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20250107002',
            fileName: 'audio_test.wav',
            fileType: '音频检测',
            detectState: '已完成',
            detectTime: '2025-01-07 09:15:42',
            result: '疑似伪造',
            resultType: 'warning',
            probability: '伪造概率：78.3%',
            fileSize: '8.7MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20250105003',
            fileName: 'image_check.jpg',
            fileType: '图片检测',
            detectState: '已完成',
            detectTime: '2025-01-05 16:45:18',
            result: '真实',
            resultType: 'success',
            probability: '真实概率：92.1%',
            fileSize: '3.4MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20250103004',
            fileName: 'meeting_recording.mp4',
            fileType: '视频检测',
            detectState: '已完成',
            detectTime: '2025-01-03 11:20:33',
            result: '真实',
            resultType: 'success',
            probability: '真实概率：89.5%',
            fileSize: '45.8MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20250101005',
            fileName: 'voice_sample.wav',
            fileType: '音频检测',
            detectState: '已完成',
            detectTime: '2025-01-01 20:10:15',
            result: '疑似伪造',
            resultType: 'warning',
            probability: '伪造概率：65.2%',
            fileSize: '12.1MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20241230006',
            fileName: 'portrait_photo.jpg',
            fileType: '图片检测',
            detectState: '已完成',
            detectTime: '2024-12-30 13:55:27',
            result: '真实',
            resultType: 'success',
            probability: '真实概率：94.7%',
            fileSize: '2.8MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20241228007',
            fileName: 'interview_video.mp4',
            fileType: '视频检测',
            detectState: '已完成',
            detectTime: '2024-12-28 15:30:45',
            result: '疑似伪造',
            resultType: 'warning',
            probability: '伪造概率：82.1%',
            fileSize: '67.3MB',
            downloadPath: '#'
        },
        {
            detectId: 'DF20241225008',
            fileName: 'speech_audio.wav',
            fileType: '音频检测',
            detectState: '已完成',
            detectTime: '2024-12-25 10:15:30',
            result: '真实',
            resultType: 'success',
            probability: '真实概率：91.3%',
            fileSize: '18.9MB',
            downloadPath: '#'
        }
    ]);

    // 获取结果标签类型
    function getResultTagType(result) {
        switch(result) {
            case '真实':
                return 'success';
            case '疑似伪造':
                return 'warning';
            case '确认伪造':
                return 'danger';
            default:
                return 'info';
        }
    }

    // 下载文件
    function downloadFile(path) {
        console.log('下载文件:', path);
        // 这里可以添加实际的下载逻辑
    }
</script>

<template>
    <div class="history-container">
        <ElCard class="main-card" shadow="hover">
            <template #header>
                <div class="header-section">
                    <h2 class="title">检测历史</h2>
                    <div class="stats-info">
                        <span class="total-count">共 {{ tableData.length }} 条记录</span>
                    </div>
                </div>
            </template>
            
            <div class="table-container">
                <ElTable 
                    :data="tableData" 
                    style="width: 100%;"
                    stripe
                    :header-cell-style="{ background: '#f5f7fa', color: '#606266' }"
                >
                    <ElTableColumn prop="detectId" label="检测号" width="140" align="center">
                        <template #default="scope">
                            <span class="detect-id">{{ scope.row.detectId }}</span>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="fileName" label="文件名称" min-width="180">
                        <template #default="scope">
                            <div class="file-info">
                                <span class="file-name">{{ scope.row.fileName }}</span>
                                <span class="file-size">{{ scope.row.fileSize }}</span>
                            </div>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="fileType" label="文件类型" width="100" align="center">
                        <template #default="scope">
                            <ElTag :type="scope.row.fileType === '视频检测' ? 'primary' : scope.row.fileType === '音频检测' ? 'success' : 'warning'">
                                {{ scope.row.fileType }}
                            </ElTag>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="detectState" label="检测状态" width="100" align="center">
                        <template #default="scope">
                            <ElTag type="success" v-if="scope.row.detectState === '已完成'">
                                {{ scope.row.detectState }}
                            </ElTag>
                            <ElTag type="warning" v-else-if="scope.row.detectState === '检测中'">
                                {{ scope.row.detectState }}
                            </ElTag>
                            <ElTag type="danger" v-else>
                                {{ scope.row.detectState }}
                            </ElTag>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="detectTime" label="检测时间" width="160" align="center">
                        <template #default="scope">
                            <span class="detect-time">{{ scope.row.detectTime }}</span>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="result" label="检测结果" width="120" align="center">
                        <template #default="scope">
                            <ElTag :type="getResultTagType(scope.row.result)">
                                {{ scope.row.result }}
                            </ElTag>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn prop="probability" label="概率详情" width="140" align="center">
                        <template #default="scope">
                            <span class="probability">{{ scope.row.probability }}</span>
                        </template>
                    </ElTableColumn>
                    
                    <ElTableColumn label="操作" width="100" align="center">
                        <template #default="scope">
                            <ElButton 
                                type="primary" 
                                size="small" 
                                @click="downloadFile(scope.row.downloadPath)"
                            >
                                下载
                            </ElButton>
                        </template>
                    </ElTableColumn>
                </ElTable>
            </div>
        </ElCard>
    </div>
</template>

<style scoped>
    .history-container {
        width: 100%;
        height: 100%;
        padding: 20px;
        box-sizing: border-box;
    }
    
    .main-card {
        width: 100%;
        height: 100%;
        border-radius: 12px;
    }
    
    .header-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
    }
    
    .title {
        font-size: 24px;
        font-weight: 600;
        color: #333;
        margin: 0;
    }
    
    .stats-info {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    
    .total-count {
        color: #666;
        font-size: 14px;
    }
    
    .table-container {
        height: calc(100% - 80px);
        overflow: auto;
    }
    
    .detect-id {
        font-family: 'Courier New', monospace;
        font-weight: 500;
        color: #409EFF;
    }
    
    .file-info {
        display: flex;
        flex-direction: column;
        gap: 4px;
    }
    
    .file-name {
        font-weight: 500;
        color: #333;
    }
    
    .file-size {
        font-size: 12px;
        color: #999;
    }
    
    .detect-time {
        font-size: 13px;
        color: #666;
    }
    
    .probability {
        font-size: 12px;
        color: #666;
        font-weight: 500;
    }
    
    /* 表格悬停效果 */
    :deep(.el-table__row:hover) {
        background-color: #f5f7fa;
    }
    
    /* 自定义滚动条 */
    .table-container::-webkit-scrollbar {
        width: 6px;
        height: 6px;
    }
    
    .table-container::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 3px;
    }
    
    .table-container::-webkit-scrollbar-thumb {
        background: #c1c1c1;
        border-radius: 3px;
    }
    
    .table-container::-webkit-scrollbar-thumb:hover {
        background: #a8a8a8;
    }
</style>