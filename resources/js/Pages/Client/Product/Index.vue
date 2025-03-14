<script>


import ProductCard from "@/Components/Product/Client/ProductCard.vue";
import MainLayout from "@/Layouts/MainLayout.vue";
import Sidebar from "@/Components/Sidebar.vue";

export default {
    name: "Index",
    layout:MainLayout,
    components: {Sidebar, ProductCard},

    props:{
        products:Array,
    },

}
</script>

<template>

    <div>
        <section class="flex ">
            <aside class="w-1/8 min-h-screen">
                <nav>
                    nav
                </nav>
            </aside>
            <article class="w-7/8 bg-gray-50 w-full mr-12 grid grid-cols-4">
                <div v-for="product in products" class="">
                    <product-card :product="product"/>
                </div>
            </article>
        </section>
    </div>
</template>

<style scoped>

</style>
