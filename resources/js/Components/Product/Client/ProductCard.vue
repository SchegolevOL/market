<script>
export default {
    name: "ProductCard",
    props:{
        product:Object,
    }
}
</script>

<template>
<div>
    <div class="relative max-w-xs border border-solid border-gray-200 rounded-2xl transition-all duration-500 ">
        <div class="block overflow-hidden w-full">
            <img :src="product.preview_image_url" :alt="product.title" class="object-contain  h-48 w-full"/>
        </div>
        <div class="p-4">
            <h4 class="text-base font-semibold text-gray-900 mb-2 capitalize transition-all duration-500 ">{{product.title}}</h4>
            <p class="text-sm font-normal text-gray-500 transition-all duration-500 leading-5 mb-5">{{product.description}}</p>
            <h4 class="text-base font-semibold text-gray-900 mb-2 capitalize transition-all duration-500 ">Price : {{product.price}}</h4>
            <button class="bg-indigo-600 shadow-sm rounded-full py-2 px-5 text-xs text-white font-semibold">Buy</button>
        </div>
    </div>
</div>
</template>

<style scoped>

</style>
