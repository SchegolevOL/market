<script>
import Sidebar from "@/Components/Sidebar.vue";

export default {
    name: "MainLayout",
    components: {Sidebar},

}
</script>

<template>
    <section class="w-full p-4 border-b border-gray-100">
        <header>
            Market Admin
        </header>
    </section><slot/>

    <section>
        <footer>

        </footer>
    </section>
</template>

<style scoped>

</style>
