<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
import axios from "axios";

export default {
    name: "Edit",
    layout: AdminLayout,
    components: {
        Link
    },
    props: {
        categories: Array,
        productGroups: Array,
        product:Object,

    },
    data() {
        return {
            entries:{
                product:this.product,
                images:null,
                params:[],
                _method:'patch',
            },
            success: false
        }

    },
    methods: {
        updateProduct() {
            console.log(this.product.images)
            axios.post(route('admin.products.update', this.product.id), this.entries, {
                headers:{
                    "Content-Type": "multipart/form-data"
                }
            })
                .then(res => {
                    this.product.images = res.data.data.images
                    this.success = true
                })
        },
        deleteImages(image){
            axios.delete(route('admin.images.destroy', image.id)).then(res=>{

                this.product.images = this.product.images.filter(productImage=>productImage.id !== image.id)
            })
        },
        setImages(e){

            this.entries.images = e.target.files

        },
      watch: {
        param: {
          handler(new_val, old_val){
            this.success=false
          },
          deep: true
        }
      },

    },


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

        <div v-if="success"
             class="p-4 mb-4 text-sm text-emerald-500 rounded-xl bg-emerald-50 border border-emerald-400 font-normal"
             role="alert">
            <span class="font-semibold mr-2">Success</span> Your subscription payment is successful
        </div>

        <!--      Start Displaying images        -->
        <div class="flex justify-between">
            <div v-for="image in product.images"
                 class="w-full relative h-auto p-1 border border-gray-200 rounded-md max-w-sm mx-auto text-center">
                <img :src="image.url" :alt="product.title" class="rounded-md max-w-full h-auto">
                <div >
                    <a @click.prevent="deleteImages(image)" href="" class="inline-block px-2 py-1 text-sm bg-red-500 text-white absolute inset-x-0 bottom-0">del</a>
                </div>
            </div>

        </div>
        <!--      End Displaying images        -->

        <div class="p-4">
            <h1 class="text-center">Create Product</h1>
            <div class="block w-full">
                <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Title</label>
                <input type="text" v-model="entries.product.title"
                       class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none "
                       placeholder="Title" required="">
            </div>
            <div class="grid grid-cols-2 gap-2 text-white text-sm text-center font-bold leading-6">
                <div class="block w-full">
                    <label for="countries"
                           class="block mb-2 text-sm font-medium text-gray-600 w-full">Description</label>

                    <textarea v-model="entries.product.description"
                              class="block w-full h-40 px-4 py-2.5 text-base leading-7 font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-2xl placeholder-gray-400 focus:outline-none resize-none"
                              placeholder="Write a description..."></textarea>
                </div>
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Content</label>

                    <textarea v-model="entries.product.content"
                              class="block w-full h-40 px-4 py-2.5 text-base leading-7 font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-2xl placeholder-gray-400 focus:outline-none resize-none"
                              placeholder="Write a content..."></textarea>
                </div>
            </div>
            <div class="grid grid-cols-3 gap-3 text-white text-sm text-center font-bold leading-6">
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Price</label>
                    <input type="number" v-model="entries.product.price"
                           class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none "
                           placeholder="Price" required="">
                </div>
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Old Price</label>
                    <input type="number" v-model="entries.product.old_price"
                           class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none "
                           placeholder="Old Price" required="">
                </div>
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">QTY</label>
                    <input type="number" v-model="entries.product.qty"
                           class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none "
                           placeholder="QTY" required="">
                </div>
            </div>
            <div class="grid grid-cols-2 gap-2 text-white text-sm text-center font-bold leading-6">
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Select
                        Category</label>
                    <select v-model="entries.product.category_id"
                            class="h-12 border border-gray-300 text-gray-600 text-base rounded-lg block w-full py-2.5 px-4 focus:outline-none">
                        <option :value="null" disabled>Select Category</option>
                        <option v-for="category in categories" :value="category.id">

                            {{ category.title }}

                        </option>
                    </select>
                </div>
                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Select Product Group</label>
                    <select v-model="entries.product.product_group_id"
                            class="h-12 border border-gray-300 text-gray-600 text-base rounded-lg block w-full py-2.5 px-4 focus:outline-none">
                        <option :value="null" disabled>Select Product Group</option>
                        <option v-for="productGroup in productGroups" :value="productGroup.id">

                            {{ productGroup.title }}

                        </option>
                    </select>
                </div>
<!--Start Select Params-->
<!--                <div class="block w-full">
                    <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Select Product Group</label>
                    <select v-model="entries.params"
                            class="h-12 border border-gray-300 text-gray-600 text-base rounded-lg block w-full py-2.5 px-4 focus:outline-none">
                        <option :value="null" disabled>Select Product Group</option>
                        <option v-for="productGroup in productGroups" :value="productGroup.id">

                            {{ productGroup.title }}

                        </option>
                    </select>
                </div>-->
<!--End Select Params-->

            </div>
            <!--Add Images-->
            <div>
                <div class="grid gap-1 mb-3">
                    <div class="flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <g id="Attach 01">
                                <path id="Vector" d="M13.5756 7.08335L7.97765 13.0209C7.4895 13.5386 6.69804 13.5386 6.20988 13.0209C5.72173 12.5031 5.72173 11.6636 6.20988 11.1459L11.8078 5.20835M11.2202 5.83335L12.3987 4.58335C13.375 3.54782 14.9579 3.54782 15.9342 4.58335C16.9105 5.61889 16.9105 7.29782 15.9342 8.33336L14.7557 9.58336M15.3433 8.95835L9.7454 14.8959C8.28093 16.4492 5.90657 16.4492 4.4421 14.8959C2.97763 13.3426 2.97763 10.8242 4.4421 9.27085L10.04 3.33334" stroke="#4F46E5" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" />
                            </g>
                        </svg>
                        <span class="text-center text-gray-400   text-sm font-medium leading-snug">Attach File</span>
                    </div>
                    <p class="text-center text-gray-400   text-xs font-normal leading-4">Attach up to 10 file at a time, total file size may not exceed 25 MB</p>
                </div>
                <label>
                    <div class="mb-5 w-full h-11 rounded-3xl border border-gray-300 justify-between items-center inline-flex">
                        <h2 class="text-gray-900/20 text-sm font-normal leading-snug pl-4">No file chosen</h2>
                        <input @change="setImages" type="file" multiple hidden/>
                        <div class="flex w-28 h-11 px-2 flex-col bg-indigo-600 rounded-r-3xl shadow text-white text-xs font-semibold leading-4
                                       items-center justify-center cursor-pointer focus:outline-none">Choose File </div>
                    </div>
                </label>

            </div>
            <!--End add Images-->


            <div class="flex p-4">
                <a href="#" @click.prevent="updateProduct"
                   class="w-52 p-2 text-center h-12 bg-indigo-600 hover:bg-indigo-800 transition-all duration-700 rounded-full shadow-xs text-white text-base font-semibold leading-6">Update
                    Product</a>
            </div>

        </div>
    </div>
</template>

<style scoped>

</style>
