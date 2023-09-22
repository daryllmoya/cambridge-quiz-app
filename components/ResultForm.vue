<template>
  <div class="h-screen">
    <Card :title="'Quiz Result'">
      <p>Your Score: {{ score }}</p>
      <p>Recommendation: {{ getQuizRecommendation(score) }}</p>
    </Card>
  </div>
</template>
  
<script lang="ts">
import { courseRecommendations } from '~/constants/Quiz.constants';

export default defineComponent({
  props: {
    score: Number,
  },
  methods: {
    getQuizRecommendation(score?: number): string {
      let defaultRecommendation = 'No recommendation available';
      // Optional chaining to safely access score
      const safeScore = score?.valueOf();

      if (safeScore !== undefined) {
        // Find the appropriate course recommendation based on the user's score
        for (const recommendation of courseRecommendations) {
          if (safeScore >= recommendation.score) {
            return recommendation.course;
          }
        }
      }

      // Default recommendation if no match found or score is undefined
      return defaultRecommendation;
    },
  }
});
</script>
