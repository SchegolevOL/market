<script>
export default {
name: "ErrorValidate",
    props:{
    messages:Array
    }
}
</script>

<template>
  <div>
      <div v-for="message in messages" class="text-sm text-red-600 text-center">
          <p>{{message}}</p>
      </div>
  </div>
</template>

<style scoped>

</style>
