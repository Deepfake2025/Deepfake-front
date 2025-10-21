//这里和令牌相关的函数的函数
//登录和注册的功能直接封装到组件中了
//以下内容没用，所以token相关的都存到cookie里
//但还是多个自动登录的函数
import { useRouter } from "vue-router"
const router=useRouter()
const  authService={
    async autoLogin(){
        
    }
}
export default authService