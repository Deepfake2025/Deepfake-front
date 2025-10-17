//这里和令牌相关的函数的函数
//登录和注册的功能直接封装到组件中了
//以下内容没用，所以token相关的都存到cookie里
import { useRouter } from "vue-router"
const router=useRouter()
const  authService={
    setToken(token,refreshToken){
        //将token保存到本地
        //关闭浏览器后数据会清除
        sessionStorage.setItem("auth_token",token)
        sessionStorage.setItem("auth_refreshToken",refreshToken)
    },
    ifTokenExit(){
        //检测本地有没有token
        const auth_token= sessionStorage.getItem("auth_token",token)
        const auth_refreshToken=sessionStorage.getItem("auth_refreshToken")
        console.log("两个token的值",auth_token,auth_refreshToken)
        return !!auth_token&&!!auth_refreshToken
    },
    
    refreshToken(){
        //重新刷新token
    },
    getToken(){
        //从本地获取token
        return sessionStorage.getItem("auth_token")
    },
    checkToken(){
        //对token进行全方位检查操作
        //token过期时尝试刷新，如果刷新失败，那么跳转到登录页面
        //刷新成功就保存新的token
        //如果token直接不存在了，那么直接跳转到登录页面
        if(!this.ifTokenExit()){
            //token不存在直接跳转登录页面
            router.push("/Login")
        }else{
             router.push("/Home")
        }
    }

}
export default authService