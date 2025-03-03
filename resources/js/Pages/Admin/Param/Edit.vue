<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
import axios from "axios";
export default {
    name: "edit",
    layout: AdminLayout,
    components:{
        Link
    },
    props:{

        param: Object,
        filterTypes:Array,

    },
    data(){
        return{
            success:false,

            }
        },
    methods:{
        updateParam(){

            axios.patch(route('admin.params.update', this.param), this.param)
                .then(res=>{
                    this.success = true
                    console.log(res)
                })
        },

    }
}
</script>

<template>

<div>

    <div class="p-4">

        <Link :href="route('admin.params.index')"
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
        <h1 class="text-center">Update Param</h1>
        <div class="block w-full">
            <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Title</label>
            <input type="text" v-model="param.title" class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none " placeholder="Title" required="">
        </div>
        <div class="block w-full">
            <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Filter Type</label>
            <select v-model="param.filter_type" class="h-12 border border-gray-300 text-gray-600 text-base rounded-lg block w-full py-2.5 px-4 focus:outline-none">
                <option :value="null" disabled>Select Filter Type </option>
                <option v-for="filterType in filterTypes" :value="filterType.value" >

                    {{filterType.title}}

                </option>
            </select>
        </div>

        <div class="flex p-4">
            <a href="#" @click.prevent="updateParam" class="w-52 p-2 text-center h-12 bg-indigo-600 hover:bg-indigo-800 transition-all duration-700 rounded-full shadow-xs text-white text-base font-semibold leading-6">Update</a>
        </div>

    </div>
</div>
</template>

<style scoped>

</style>
