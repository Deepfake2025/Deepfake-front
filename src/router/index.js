import { createMemoryHistory ,createRouter } from "vue-router";


import Login from "@/view/userManage/Login.vue";
import Register from "@/view/userManage/Register.vue";
import VideoDetect from "@/view/fileDetect/VideoDetect.vue";

const routes=[
    {path: '/',redirect:'/Login'},
    {path: '/Login',component:Login},
    {path: '/Register',component:Register},
    {path: '/videoDetect',component:VideoDetect}
]
 const router=createRouter({
    history:createMemoryHistory(),
    routes,
})
export default router