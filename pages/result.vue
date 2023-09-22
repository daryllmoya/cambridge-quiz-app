<template>
  <div>
    <ResultForm :score="quizScore" />
  </div>
</template>
  
<script lang="ts">
export default defineComponent({
  data() {
    // Initialize with a default value
    return {
      quizScore: 0,
    };
  },
  mounted() {
    // Get the score from the query parameter and assign it to this.quizScore
    this.quizScore = Number(this.$route.query.score) || 0;
  }
});
</script>
