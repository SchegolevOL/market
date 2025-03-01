<script>
import {Link} from "@inertiajs/vue3";
export default {
name: "Sidebar",
  components:{
  Link,
  }
}
</script>

<template>
    <div class="w-full flex gap-4">
        <div class="w-96 p-4 bg-white flex-col justify-start items-start gap-6 inline-flex">

            <div class="w-full">
                <div class="w-full h-8 px-3 items-center flex">
                    <h6 class="text-gray-700 text-xs font-semibold leading-4">MENU</h6>
                </div>
                <ul class="flex-col gap-1 flex">
                    <li>
                      <Link :href="route('dashboard')">
                            <div class="flex-col flex p-3 bg-white rounded-lg">

                                    <h2 class="text-gray-500 text-sm font-medium leading-snug">Dashboard</h2>

                            </div>
                      </Link>
                    </li>
                    <li>
                      <Link :href="route('admin.categories.index')">
                            <div class="flex-col gap-1 flex">
                                <div class="flex-col flex p-3 bg-white rounded-lg">
                                    <div class="h-5 gap-3 flex">

                                        <h2 class="text-gray-500 text-sm font-medium leading-snug">Category</h2>
                                    </div>
                                </div>
                            </div>
                      </Link>
                    </li>
                    <li>
                      <Link :href="route('admin.products.index')">
                            <div class="flex-col gap-1 flex">
                                <div class="flex-col flex p-3 bg-white rounded-lg">
                                    <div class="h-5 gap-3 flex">

                                        <h2 class="text-gray-500 text-sm font-medium leading-snug">Product</h2>
                                    </div>
                                </div>
                            </div>
                      </Link>
                    </li>
                    <li>
                      <Link :href="route('admin.product-parents.index')">
                            <div class="flex-col gap-1 flex">
                                <div class="flex-col flex p-3 bg-white rounded-lg">
                                    <div class="h-5 gap-3 flex">
                                        <h2 class="text-gray-500 text-sm font-medium">Product Parent</h2>
                                    </div>
                                </div>
                            </div>
                      </Link>
                    </li>
                    <li>
                      <Link :href="route('admin.params.index')">
                            <div class="flex-col gap-1 flex">
                                <div class="flex-col flex p-3 bg-white rounded-lg">
                                    <div class="h-5 gap-3 flex">
                                        <h2 class="text-gray-500 text-sm font-medium">Param</h2>
                                    </div>
                                </div>
                            </div>
                      </Link>
                    </li>

                </ul>
            </div>

        </div>

    </div>
</template>

<style scoped>

</style>
