<script>


import ProductCard from "@/Components/Product/Client/ProductCard.vue";
import MainLayout from "@/Layouts/MainLayout.vue";
import Sidebar from "@/Components/Sidebar.vue";
import {Link} from "@inertiajs/vue3";

export default {
    name: "ProductIndex",
    layout: MainLayout,
    components: {
        Sidebar,
        ProductCard,
        Link
    },

    props: {
        products: Array,
        breadcrumbs: Array,
        category: Array,
        params: Array,
    },
    data(){
        return{
            filter:{
                integer:{
                    from:{},
                    to:{}
                },
                select:{},
                checkbox:{},
            },
        }
    },
    methods:{
        setFilter(param, value){
            if (this.filter.checkbox[param.id]){
                this.toggleItem(this.filter.checkbox[param.id], value)
                return
            }
            this.filter.checkbox[param.id]=[];
            this.filter.checkbox[param.id].push(value);

        },
        toggleItem(arr, value){
            let index = arr.indexOf(value)
            index === -1 ? arr.push(value):arr.splice(index, 1)

        }
    },

}
</script>

<template>

    <div>
        <section class="flex ">
            <aside class="w-1/4  min-h-screen">
                <nav class="p-4">
                    <div>
                        <div>
                            {{this.filter}}
                        </div>
                        <template v-for="param in params">



                            <!--Start Check Box Params-->
                            <div v-if="param.filter_type === 3" class="border-b-2">
                                <div>
                                    <h3>{{param.title}}</h3>
                                </div>
                                <div>
                                    <div v-for="value in param.param_value" class="mb-2 flex items-center">
                                        <input @change="setFilter(param, value)" type="checkbox" :value="value" :id="value">
                                        <label class="text-sm text-gray-500 p-4" :for="value">{{value}}</label>
                                    </div>
                                </div>
                            </div>
                            <!--End Check Box Params-->
                            <!--Start Integer Param-->
                            <div v-if="param.filter_type === 1">
                                <div>
                                    <h3>{{param.title}}</h3>
                                </div>
                                <div>
                                    <div class="mb-2 flex items-center">
                                        <input v-model="this.filter.integer.from[param.id]" type="text" placeholder="from" class="border border-gray-300 p-2">
                                        <input v-model="this.filter.integer.to[param.id]" type="text" placeholder="to" class="border border-gray-300 p-2">
                                    </div>
                                </div>
                            </div>
                            <!--End Integer Param-->
                        </template>
                        <div>
                            <a href="" class='inline-block py-2.5 px-6 text-sm rounded-full border border-solid border-indigo-200 text-indigo-600 cursor-pointer font-semibold text-center shadow-xs transition-all duration-500 hover:bg-indigo-600 hover:text-white'>
                                Button
                            </a>

                        </div>

                    </div>
                </nav>
            </aside>
            <article class="w-7/8 bg-gray-50 ">
                <div class="mb-4">
                    <template v-for="breadcrumb in breadcrumbs">
                        <Link :href="route('client.categories.products.index', breadcrumb.id)">{{ breadcrumb.title }}
                        </Link>
                        <span> / </span>
                    </template>
                    <span> {{ category.title }}</span>
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
