<script>
import Sidebar from "@/Components/Sidebar.vue";

export default {
    name: "AdminLayout",
    components: {Sidebar},

}
</script>

<template>
    <section class="w-full p-4 border-b border-gray-100">
        <header>
            Market Admin
        </header>
    </section>
    <section class="flex ">
        <aside class="w-1/8 min-h-screen">
            <nav>
                <Sidebar/>
            </nav>
        </aside>
        <article class="w-7/8 bg-gray-50 w-full mr-12">
            <slot/>
        </article>
    </section>
    <section>
        <footer>

        </footer>
    </section>
</template>

<style scoped>

</style>
