<template>
  <footer class="bg-gray-900 text-white py-4">
    <div class="container mx-auto text-center">
      <p>&copy; {{ currentYear }} Quiz App</p>
    </div>
  </footer>
</template>
  
<script lang="ts">
export default defineComponent({
  setup() {
    const currentYear = computed(() => new Date().getFullYear());
    return { currentYear };
  },
});
</script>  
