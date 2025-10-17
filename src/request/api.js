import axios from "axios";
//创造一个实例供我们使用
const api=axios.create({
    baseURL:"http://8.138.83.109:8888",
    timeout:10000,
})

export default api