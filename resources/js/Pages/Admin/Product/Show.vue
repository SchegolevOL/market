<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
import {assert} from "@vue/compiler-core";


export default {
    name: "Show",
    methods: {assert},
    layout: AdminLayout,
    props: {
        product: Array,

    },
    components: {
        Link
    }
}
</script>

<template>
    <div>
        <div class="p-4">

            <Link :href="route('admin.products.index')"
                  class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm text-green-600 font-semibold rounded-full group bg-gradient-to-br from-green-500 to-green-300 group-hover:from-green-500 group-hover:to-green-300 hover:text-white">
                                            <span
                                                class="relative py-2 px-5 transition-all ease-in duration-75 bg-white rounded-full group-hover:bg-opacity-0">
                                                Back
                                            </span>
            </Link>
        </div>
        <div>

            <div class="p-4">
                <h1 class="text-center">Product</h1>
                <!--      Start Displaying images        -->
                <div class="flex justify-between">
                    <div v-for="image in product.images"
                         class="w-full relative h-auto p-1 border border-gray-200 rounded-md max-w-sm mx-auto">
                        <img :src="image.url" alt="Image" class="rounded-md max-w-full h-auto">
                    </div>
                </div>
                <!--      End Displaying images        -->

                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Title</label>
                    <div
                        class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                        {{ product.title }}
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-2 text-white text-sm text-center font-bold leading-6">
                    <div class="block w-full">
                        <label for="countries"
                               class="block mb-2 text-sm font-medium text-gray-600 w-full">Description</label>

                        <div
                            class="block w-full h-40 px-4 py-2.5 text-base leading-7 font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-2xl placeholder-gray-400 focus:outline-none resize-none">
                            {{ product.description }}
                        </div>
                    </div>
                    <div class="block w-full">
                        <label for="countries"
                               class="block mb-2 text-sm font-medium text-gray-600 w-full">Content</label>

                        <div
                            class="block w-full h-40 px-4 py-2.5 text-base leading-7 font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-2xl placeholder-gray-400 focus:outline-none resize-none">
                            {{ product.content }}
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-3 gap-3 text-white text-sm text-center font-bold leading-6">
                    <div class="block w-full">
                        <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Price</label>
                        <div
                            class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                            {{ product.price }}
                        </div>
                    </div>
                    <div class="block w-full">
                        <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Old
                            Price</label>
                        <div
                            class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                            {{ product.old_price }}
                        </div>
                    </div>
                    <div class="block w-full">
                        <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">QTY</label>
                        <div
                            class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                            {{ product.qty }}
                        </div>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-2 text-white text-sm text-center font-bold leading-6">
                    <div class="block w-full">
                        <label for="countries"
                               class="block mb-2 text-sm font-medium text-gray-600 w-full">Category</label>
                        <div
                            class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                            {{ product.category.title }}
                        </div>
                    </div>
                    <div class="block w-full">
                        <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Product
                            Group</label>
                        <div
                            class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none ">
                            {{ product.product_group.title }}
                        </div>
                    </div>

                </div>


            </div>


        </div>
    </div>
</template>

<style scoped>

</style>

