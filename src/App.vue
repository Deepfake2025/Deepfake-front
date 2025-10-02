<script setup>
import { ref } from 'vue';
import { RouterView } from 'vue-router';
import detectPageCompose from './components/detectPageCompose.vue';
    let show=ref(false)
</script>
<template>
    <div class="all">
       <div class="LoginPart" v-show="show">
            <RouterView></RouterView>
       </div> 
       <div class="fuctionPart" v-show="!show">
            <detectPageCompose>
                <RouterView></RouterView>
            </detectPageCompose>
       </div>
    </div>
</template>
<style  scoped>
    .all{
        width: 100%;
        height: 100%;
    }
    .LoginPart{
        width: 100%;
        height: 100%;
        background-image: url(src/assets/background/pexels-orange-ocean-243774902-28770001.jpg);
        background-size: cover;
    }
    .fuctionPart{
        width: 100%;
        height: 100%;
        background-image: url(src/assets/background/pexels-bilge-celik-245699833-34113467.jpg);
        background-size: cover;
    }
</style>