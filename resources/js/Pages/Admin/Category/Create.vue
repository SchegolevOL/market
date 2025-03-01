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
       categories:Array
    },
    data(){
        return{
            category:{
                parent_id:null
            }
        }

    },
    methods:{
        storeCategory(){

            axios.post(route('admin.categories.store'), this.category)
                .then(res=>{
                    console.log(res);
                    this.category={parent_id:null}
                })
        },

    }
}
</script>

<template>

<div>
<h1 class="text-center">Create Category</h1>
    <div class="p-4">

            <div class="block w-full">
                <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Title</label>
                <input type="text" v-model="category.title" class="block w-full h-11 px-5 py-2.5 bg-white leading-7 text-base font-normal shadow-xs text-gray-900 bg-transparent border border-gray-300 rounded-lg placeholder-gray-400 focus:outline-none " placeholder="Title" required="">
            </div>
            <div class="block w-full">
                <label for="countries" class="block mb-2 text-sm font-medium text-gray-600 w-full">Category Parent</label>
                <select v-model="category.parent_id" class="h-12 border border-gray-300 text-gray-600 text-base rounded-lg block w-full py-2.5 px-4 focus:outline-none">
                    <option :value="null" selected>Not Category Parent</option>
                    <option v-for="category in categories" :value="category.id" >

                            {{category.title}}

                    </option>
                </select>
            </div>

            <div class="flex p-4">
                <a href="#" @click.prevent="storeCategory" class="w-52 p-2 text-center h-12 bg-indigo-600 hover:bg-indigo-800 transition-all duration-700 rounded-full shadow-xs text-white text-base font-semibold leading-6">Send Category</a>
            </div>

    </div>
</div>
</template>

<style scoped>

</style>
