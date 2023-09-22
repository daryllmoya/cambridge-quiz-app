<template>
  <div>
    <QuizForm :title="quizTitle" :questions="quizQuestions" />
  </div>
</template>
  
<script lang="ts">
import { quizQuestions } from '~/constants/Quiz.constants';

export default defineComponent({
  data() {
    return {
      quizTitle: 'Simple English Questions',
      quizQuestions,
    };
  },
});
</script>
  