<template>
  <div class="mx-auto max-w-prose my-6">
    <div class="bg-white rounded-lg drop-shadow-2xl p-6">
      <h2 v-if="title" class="text-2xl font-semibold mb-6">{{ title }}</h2>
      <!-- Card content -->
      <slot></slot>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String
  },
};
</script>

<style scoped>
/* Component-specific styles can go here */
</style>
  