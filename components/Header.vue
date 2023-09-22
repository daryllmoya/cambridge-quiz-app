<template>
  <header class="bg-blue-500 p-4">
    <div class="container mx-auto flex justify-between items-center">
      <a href="/" class="text-white text-2xl font-semibold">Quiz App</a>
      <nav class="hidden md:block">
        <ul class="flex space-x-4">
          <li>
            <a href="/"
              class="text-white hover:bg-blue-700 hover:text-white px-3 py-2 rounded transition duration-300">Home
            </a>
          </li>
          <li>
            <a href="/quiz"
              class="text-white hover:bg-blue-700 hover:text-white px-3 py-2 rounded transition duration-300">Quiz
            </a>
          </li>
        </ul>
      </nav>
      <button @click="toggleMobileMenu" class="md:hidden text-white text-xl">
        ☰
      </button>
    </div>
    <div v-if="isMobileMenuOpen" class="md:hidden">
      <ul class="bg-blue-500 py-2">
        <li>
          <a href="/" class="text-white hover:bg-blue-700 hover:text-white px-4 py-2 block transition duration-300">Home
          </a>
        </li>
        <li>
          <a href="/quiz"
            class="text-white hover:bg-blue-700 hover:text-white px-4 py-2 block transition duration-300">Quiz
          </a>
        </li>
      </ul>
    </div>
  </header>
</template>
  
<script lang="ts">
export default defineComponent({
  data() {
    return {
      isMobileMenuOpen: false,
    };
  },
  methods: {
    toggleMobileMenu() {
      this.isMobileMenuOpen = !this.isMobileMenuOpen;
    },
  },
});
</script>
  