<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
export default {
    name: "index",
    layout: AdminLayout,
    components:{
        Link
    }
}
</script>

<template>
<div>
    <div class="p-4">

        <Link :href="route('admin.categories.create')" class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm text-green-600 font-semibold rounded-full group bg-gradient-to-br from-green-500 to-green-300 group-hover:from-green-500 group-hover:to-green-300 hover:text-white">
                                            <span class="relative py-2 px-5 transition-all ease-in duration-75 bg-white rounded-full group-hover:bg-opacity-0">
                                                Add
                                            </span>
        </Link>
    </div>

</div>
</template>

<style scoped>

</style>
