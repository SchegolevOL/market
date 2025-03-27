<script>


import ProductCard from "@/Components/Product/Client/ProductCard.vue";
import MainLayout from "@/Layouts/MainLayout.vue";
import Sidebar from "@/Components/Sidebar.vue";
import {Link} from "@inertiajs/vue3";

export default {
    name: "ProductIndex",
    layout:MainLayout,
    components: {
        Sidebar,
        ProductCard,
        Link},

    props:{
        products:Array,
        breadcrumbs:Array,
        category:Array,
        params:Array,
    },

}
</script>

<template>

    <div>
        <section class="flex ">
            <aside class="w-1/4  min-h-screen">
                <nav>
                    nav
                </nav>
            </aside>
            <article class="w-7/8 bg-gray-50 ">
                <div class="mb-4">
                    <template v-for="breadcrumb in breadcrumbs">
                        <Link :href="route('client.categories.products.index', breadcrumb.id)">{{breadcrumb.title}}</Link>
                        <span> / </span>
                    </template>
                    <span> {{category.title}}</span>
                </div>
                <div class="w-full mr-12 grid grid-cols-4">
                    <product-card v-for="product in products" :product="product"/>
                </div>


            </article>
        </section>
    </div>
</template>

<style scoped>

</style>
