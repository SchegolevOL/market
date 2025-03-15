<script>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import {Link} from "@inertiajs/vue3";
import ProductItem from "@/Components/Product/Admin/ProductItem.vue";

export default {
    name: "index",
    layout: AdminLayout,
    props: {
        products: Array,
    },
    data() {
        return {
            productsData: this.products,
            productChildrenData: [],
        }
    },
    components: {
        ProductItem,
        Link
    },
    methods: {
        updateProductsData(product) {
            console.log('1111')
            if (product.parent_id) {
                this.productsData.forEach(productData => {
                    if (productData.id === product.parent_id) {
                        productData.children = productData.children.filter(child => child.id !== product.id)
                    }
                })
                return
            }
            this.productsData = this.productsData.filter(productData => productData.id !== product.id)
        },

    }
}
</script>

<template>
    <div>
        <div class="p-4">

            <Link :href="route('admin.products.create')"
                  class="relative inline-flex items-center justify-center p-0.5 mb-2 mr-2 overflow-hidden text-sm text-green-600 font-semibold rounded-full group bg-gradient-to-br from-green-500 to-green-300 group-hover:from-green-500 group-hover:to-green-300 hover:text-white">
                                            <span
                                                class="relative py-2 px-5 transition-all ease-in duration-75 bg-white rounded-full group-hover:bg-opacity-0">
                                                Add
                                            </span>
            </Link>
        </div>
        <div>
            <div class="flex flex-col w-full">
                <div class=" overflow-x-auto pb-4">
                    <div class="block">
                        <div class="overflow-x-auto w-full  border rounded-lg border-gray-300">
                            <table class="w-full rounded-xl">
                                <thead>
                                <tr class="bg-gray-50">

                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        Id
                                    </th>
                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        Price
                                    </th>
                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        Title
                                    </th>
                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        QTY
                                    </th>
                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        Actions
                                    </th>
                                    <th scope="col"
                                        class="p-5 text-left whitespace-nowrap text-sm leading-6 font-semibold text-gray-900 capitalize">
                                        Product
                                    </th>
                                </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-300 ">
                                <template v-for="product in productsData">

                                    <product-item @product_deleted="updateProductsData"
                                                  :product="product"></product-item>
                                    <template v-if="product.children" v-for="productChild in product.children">
                                        <product-item @product_deleted="updateProductsData"
                                                      :product="productChild"></product-item>


                                    </template>
                                </template>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>

</style>
