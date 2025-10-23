<script setup>
import { ElCard, ElButton, ElProgress, ElTag, ElDivider, ElRow, ElCol, ElStatistic, ElAlert } from 'element-plus';
import { ref, onMounted } from 'vue';
import { useRouter, useRoute } from 'vue-router';

const router = useRouter();
const route = useRoute();

// 模拟检测结果数据
const detectResult = ref({
    detectId: 'DF20250108001',
    fileName: 'sample_video.mp4',
    fileType: '视频检测',
    fileSize: '15.2MB',
    detectTime: '2025-01-08 14:30:25',
    status: 'completed', // completed, processing, error
    overallResult: '疑似伪造',
    confidence: 78.3,
    recommendations: [
        '建议进行人工复核',
        '可尝试使用其他检测工具验证',
        '注意保护个人隐私信息'
    ]
});

// 根据置信度确定结果类型
function getResultType(confidence) {
    if (confidence >= 80) return 'danger';
    if (confidence >= 60) return 'warning';
    return 'success';
}

// 根据置信度确定结果文本
function getResultText(confidence) {
    if (confidence >= 80) return '确认伪造';
    if (confidence >= 60) return '疑似伪造';
    return '真实';
}

// 返回上传页面
function goBack() {
    const fileType = detectResult.value.fileType;
    if (fileType.includes('视频')) {
        router.push('/VideoDetect');
    } else if (fileType.includes('音频')) {
        router.push('/AudioDetect');
    } else if (fileType.includes('图片')) {
        router.push('/ImageDetect');
    }
}

// 查看历史记录
function viewHistory() {
    router.push('/History');
}

// 重新检测
function reDetect() {
    goBack();
}

// 模拟从路由参数获取检测结果
onMounted(() => {
    // 这里可以从路由参数或API获取实际的检测结果
    console.log('检测结果页面加载完成');
});
</script>

<template>
    <div class="result-container">
        <ElCard class="main-card" shadow="hover">
            <!-- 页面头部 -->
            <template #header>
                <div class="header-section">
                    <div class="title-section">
                        <h2 class="page-title">检测结果</h2>
                        <ElTag :type="getResultType(detectResult.confidence)" size="large">
                            {{ getResultText(detectResult.confidence) }}
                        </ElTag>
                    </div>
                    <div class="action-buttons">
                        <ElButton @click="goBack" icon="ArrowLeft">返回上传</ElButton>
                        <ElButton type="primary" @click="viewHistory" icon="List">查看历史</ElButton>
                    </div>
                </div>
            </template>

            <!-- 检测概览 -->
            <div class="overview-section">
                <ElRow :gutter="20">
                    <ElCol :span="8">
                        <div class="info-card">
                            <h4>文件信息</h4>
                            <div class="info-item">
                                <span class="label">文件名：</span>
                                <span class="value">{{ detectResult.fileName }}</span>
                            </div>
                            <div class="info-item">
                                <span class="label">文件类型：</span>
                                <span class="value">{{ detectResult.fileType }}</span>
                            </div>
                            <div class="info-item">
                                <span class="label">文件大小：</span>
                                <span class="value">{{ detectResult.fileSize }}</span>
                            </div>
                            <div class="info-item">
                                <span class="label">检测时间：</span>
                                <span class="value">{{ detectResult.detectTime }}</span>
                            </div>
                        </div>
                    </ElCol>
                    
                    <ElCol :span="8">
                        <div class="result-card">
                            <h4>检测结果</h4>
                            <div class="confidence-display">
                                <ElStatistic 
                                    :value="detectResult.confidence" 
                                    suffix="%" 
                                    :precision="1"
                                    :value-style="{ color: getResultType(detectResult.confidence) === 'danger' ? '#f56c6c' : getResultType(detectResult.confidence) === 'warning' ? '#e6a23c' : '#67c23a' }"
                                />
                                <p class="confidence-label">伪造概率</p>
                            </div>
                            <ElProgress 
                                :percentage="detectResult.confidence" 
                                :color="getResultType(detectResult.confidence) === 'danger' ? '#f56c6c' : getResultType(detectResult.confidence) === 'warning' ? '#e6a23c' : '#67c23a'"
                                :stroke-width="8"
                            />
                        </div>
                    </ElCol>
                    
                    <ElCol :span="8">
                        <div class="action-card">
                            <h4>操作</h4>
                            <div class="action-buttons-vertical">
                                <ElButton type="primary" @click="reDetect" icon="Refresh">重新检测</ElButton>
                            </div>
                        </div>
                    </ElCol>
                </ElRow>
            </div>
            
            <ElDivider />

            <!-- 建议和说明 -->
            <div class="recommendations-section">
                <h3 class="section-title">检测建议</h3>
                <ElAlert
                    :title="detectResult.overallResult === '疑似伪造' ? '检测到疑似伪造内容' : detectResult.overallResult === '确认伪造' ? '确认存在伪造内容' : '内容真实性较高'"
                    :type="getResultType(detectResult.confidence)"
                    :closable="false"
                    show-icon
                >
                    <template #default>
                        <ul class="recommendations-list">
                            <li v-for="(recommendation, index) in detectResult.recommendations" :key="index">
                                {{ recommendation }}
                            </li>
                        </ul>
                    </template>
                </ElAlert>
            </div>

            <!-- 底部操作区 -->
            <div class="footer-actions">
                <ElButton size="large" @click="goBack">返回上传</ElButton>
                <ElButton type="primary" size="large" @click="viewHistory">查看历史记录</ElButton>
            </div>
        </ElCard>
    </div>
</template>

<style scoped>
.result-container {
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

.title-section {
    display: flex;
    align-items: center;
    gap: 15px;
}

.page-title {
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin: 0;
}

.action-buttons {
    display: flex;
    gap: 10px;
}

.overview-section {
    margin-bottom: 30px;
}

.info-card, .result-card, .action-card {
    background: #f8f9fa;
    border-radius: 8px;
    padding: 20px;
    height: 200px;
    display: flex;
    flex-direction: column;
}

.info-card h4, .result-card h4, .action-card h4 {
    margin: 0 0 15px 0;
    color: #333;
    font-size: 16px;
    font-weight: 600;
}

.info-item {
    display: flex;
    margin-bottom: 8px;
}

.label {
    font-weight: 500;
    color: #666;
    min-width: 80px;
}

.value {
    color: #333;
}

.confidence-display {
    text-align: center;
    margin-bottom: 15px;
}

.confidence-label {
    margin: 5px 0 0 0;
    color: #666;
    font-size: 14px;
}

.action-buttons-vertical {
    display: flex;
    flex-direction: column;
    gap: 10px;
    flex: 1;
    justify-content: center;
}

.details-section {
    margin-bottom: 30px;
}

.section-title {
    font-size: 20px;
    font-weight: 600;
    color: #333;
    margin-bottom: 20px;
}

.detail-card {
    height: 100%;
}

.detail-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.detail-header h4 {
    margin: 0;
    font-size: 16px;
    font-weight: 600;
}

.detail-content {
    padding: 10px 0;
}

.confidence-bar {
    margin-bottom: 15px;
}

.confidence-text {
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

.detail-description {
    color: #666;
    font-size: 14px;
    line-height: 1.5;
    margin: 0;
}

.recommendations-section {
    margin-bottom: 30px;
}

.recommendations-list {
    margin: 10px 0 0 0;
    padding-left: 20px;
}

.recommendations-list li {
    margin-bottom: 5px;
    color: #666;
}

.footer-actions {
    display: flex;
    justify-content: center;
    gap: 20px;
    padding-top: 20px;
    border-top: 1px solid #ebeef5;
}

/* 响应式设计 */
@media (max-width: 768px) {
    .header-section {
        flex-direction: column;
        gap: 15px;
        align-items: flex-start;
    }
    
    .action-buttons {
        width: 100%;
        justify-content: flex-end;
    }
    
    .footer-actions {
        flex-direction: column;
        align-items: center;
    }
    
    .info-card, .result-card, .action-card {
        height: auto;
        min-height: 150px;
    }
}
</style>