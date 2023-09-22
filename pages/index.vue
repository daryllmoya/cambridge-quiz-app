<template>
  <div class="home-container">
    <h1 class="text-4xl font-semibold mb-4">Welcome to the Quiz App</h1>
    <button @click="startQuiz" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Start Quiz</button>
  </div>
</template>

<script lang="ts">
export default defineComponent({
  methods: {
    startQuiz() {
      this.$router.push('/quiz'); // Navigate to the quiz page
    },
  },
});
</script>

<style scoped>
.home-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  text-align: center;
  overflow: hidden;
}

/* Add more styling as needed */
</style>
