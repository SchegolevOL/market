<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
import axios from "axios";
export default {
    name: "index",
    layout: AdminLayout,
    components:{
        Link
    },
    props:{


    },
    data(){
        return{
            productGroup:{

            },
            success: false
        }

    },
    methods:{
        storeProductGroup(){
            console.log(this.productGroup.title)
            axios.post(route('admin.product-groups.store'), this.productGroup)
                .then(res=>{


                    setTimeout(()=>{this.success = false}, 2000)
                    this.success = true
                    this.productGroup.title=''
                })
        },

    },


}
</script>

<template>

<div>

    <div class="p-4">

        <Link :href="route('admin.product-groups.index')"
              class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm text-green-600 font-semibold rounded-full group bg-gradient-to-br from-green-500 to-green-300 group-hover:from-green-500 group-hover:to-green-300 hover:text-white">
                                            <span
                                                class="relative py-2 px-5 transition-all ease-in duration-75 bg-white rounded-full group-hover:bg-opacity-0">
                                                Back
                                            </span>
        </Link>
    </div>

    <div v-if="success" class="p-4 mb-4 text-sm text-emerald-500 rounded-xl bg-emerald-50 border border-emerald-400 font-normal" role="alert">
        <span class="font-semibold mr-2">Success</span> Your subscription payment is successful
    </div>
    <div class="p-4">
        <h1 class="text-center">Create ProductGroup</h1>
            <div class="block w-full">
                <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Title</label>
                <input type="text" v-model="productGroup.title" class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none " placeholder="Title" required="">
            </div>


            <div class="flex p-4">
                <a href="#" @click.prevent="storeProductGroup" class="w-52 p-2 text-center h-12 bg-indigo-600 hover:bg-indigo-800 transition-all duration-700 rounded-full shadow-xs text-white text-base font-semibold leading-6">Send ProductGroup</a>
            </div>

    </div>
</div>
</template>

<style scoped>

</style>
