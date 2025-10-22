import { createMemoryHistory ,createRouter } from "vue-router";


import Login from "@/view/userManage/Login.vue";
import Register from "@/view/userManage/Register.vue";
import VideoDetect from "@/view/fileDetect/VideoDetect.vue";
import AudioDetect from "@/view/fileDetect/AudioDetect.vue";
import DetectHistory from "@/view/history/DetectHistory.vue";
import ImageDetect from "@/view/fileDetect/ImageDetect.vue";
import UserCenter from "@/view/userManage/UserCenter.vue";
import HomePage from "@/view/HomePage.vue";
const routes=[
    {path: '/',redirect:'/Login'},
    {path: '/Login',component:Login},
    {path: '/Register',component:Register},
    {path: '/VideoDetect',component:VideoDetect},
    {path: '/AudioDetect',component:AudioDetect},
    {path: '/ImageDetect',component:ImageDetect},
    {path: '/History',component:DetectHistory},
    {path: '/UserCenter',component:UserCenter},
    {path: '/Home',component:HomePage},
]
 const router=createRouter({
    history:createMemoryHistory(),
    routes,
})
export default router