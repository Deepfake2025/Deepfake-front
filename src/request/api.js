import axios from "axios";
//创造一个实例供我们使用
const api=axios.create({
    baseURL:"http://8.138.83.109:8888",
    timeout:10000,
})
const apiTest=axios.create({
    baseURL:"https://0c9efb1f-20f1-465a-98be-8e202085d916.mock.pstmn.io",
    timeout:10000,
})

export default api
export {apiTest}