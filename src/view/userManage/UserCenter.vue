<script setup>
    import UserinfromModifyCard from '@/components/UserinfromModifyCard.vue';
    import UserInformationCard from '@/components/UserInformationCard.vue';
    import { ElContainer,ElAside,ElMain,ElRow,ElCol } from 'element-plus';
</script>

<template>
    <div class="all">
        <div class="page-container">
            <!-- 顶部用户概览区域 -->
            <div class="top-section">
                <el-row :gutter="30" class="cards-row">
                    <el-col :span="8">
                        <user-information-card class="profile-card"></user-information-card>
                    </el-col>
                    <el-col :span="16">
                        <UserinfromModifyCard class="info-card"></UserinfromModifyCard>
                    </el-col>
                </el-row>
            </div>
            
            <!-- 底部功能区域 -->
            <div class="bottom-section">
                <el-row :gutter="30" class="stats-row">
                    <el-col :span="6">
                        <div class="stat-card">
                            <div class="stat-icon">📊</div>
                            <div class="stat-number">121</div>
                            <div class="stat-label">总检测次数</div>
                        </div>
                    </el-col>
                    <el-col :span="6">
                        <div class="stat-card">
                            <div class="stat-icon">✅</div>
                            <div class="stat-number">98</div>
                            <div class="stat-label">成功检测</div>
                        </div>
                    </el-col>
                    <el-col :span="6">
                        <div class="stat-card">
                            <div class="stat-icon">⚠️</div>
                            <div class="stat-number">23</div>
                            <div class="stat-label">疑似伪造</div>
                        </div>
                    </el-col>
                    <el-col :span="6">
                        <div class="stat-card">
                            <div class="stat-icon">📅</div>
                            <div class="stat-number">7</div>
                            <div class="stat-label">本月检测</div>
                        </div>
                    </el-col>
                </el-row>
                
                <!-- 最近检测记录 -->
                <div class="recent-section">
                    <h3 class="section-title">最近检测记录</h3>
                    <div class="recent-list">
                        <div class="recent-item">
                            <div class="recent-file">video_sample.mp4</div>
                            <div class="recent-result success">真实</div>
                            <div class="recent-time">2小时前</div>
                        </div>
                        <div class="recent-item">
                            <div class="recent-file">audio_test.wav</div>
                            <div class="recent-result warning">疑似伪造</div>
                            <div class="recent-time">1天前</div>
                        </div>
                        <div class="recent-item">
                            <div class="recent-file">image_check.jpg</div>
                            <div class="recent-result success">真实</div>
                            <div class="recent-time">3天前</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
    .all {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        padding: 20px;
        box-sizing: border-box;
    }
    
    .page-container {
        width: 100%;
        max-width: 1200px;
        height: 100%;
        display: flex;
        flex-direction: column;
        gap: 30px;
    }
    
    .top-section {
        flex: 0 0 auto;
    }
    
    .cards-row {
        height: 100%;
    }
    
    .profile-card {
        height: 100%;
    }
    
    .info-card {
        height: 100%;
    }
    
    .bottom-section {
        flex: 1;
        display: flex;
        flex-direction: column;
        gap: 30px;
    }
    
    .stats-row {
        margin-bottom: 20px;
    }
    
    .stat-card {
        background: white;
        border-radius: 12px;
        padding: 25px;
        text-align: center;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 120px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }
    
    .stat-icon {
        font-size: 24px;
        margin-bottom: 10px;
    }
    
    .stat-number {
        font-size: 28px;
        font-weight: bold;
        color: #409EFF;
        margin-bottom: 5px;
    }
    
    .stat-label {
        font-size: 14px;
        color: #666;
    }
    
    .recent-section {
        background: white;
        border-radius: 12px;
        padding: 25px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        flex: 1;
    }
    
    .section-title {
        font-size: 20px;
        font-weight: 600;
        color: #333;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 2px solid #409EFF;
    }
    
    .recent-list {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    
    .recent-item {
        display: flex;
        align-items: center;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 8px;
        transition: background-color 0.3s ease;
    }
    
    .recent-item:hover {
        background: #e9ecef;
    }
    
    .recent-file {
        flex: 1;
        font-weight: 500;
        color: #333;
    }
    
    .recent-result {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 500;
        margin-right: 15px;
    }
    
    .recent-result.success {
        background: #d4edda;
        color: #155724;
    }
    
    .recent-result.warning {
        background: #fff3cd;
        color: #856404;
    }
    
    .recent-time {
        color: #666;
        font-size: 14px;
    }
</style>