//这里写和文件上传相关的函数
import { countdownEmits } from "element-plus";
import api from "./api";
import { apiTest } from "./api";
const uploadFileService={
    async initUpload(f){
        //初始化文件上传任务的
        //活动请求体的数据
        const data={
            fileName:f.name,
            fileSize:f.size,
            mimeType:f.type
        }
        //准备发送post请求
        apiTest.post("/upload/init",data).then(res=>{
            if(res.data.code===0){
                return res.data
                //返回uploadId和chunkSize
            }
            else{
                throw new Error("文件任务初始化失败")
            }
        }).catch(err=>{
                console.log("初始化任务上传的错误",err)
                throw new Error("文件任务初始化失败")
        })
    },



}
export default uploadFileService