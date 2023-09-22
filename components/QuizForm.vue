<template>
  <Card :title="'Simple English Questions'">
    <form @submit.prevent="getQuizScore" v-if="questions && questions.length">
      <div v-for="(question, index) in questions" :key="index" class="my-4">
        <p class="font-medium">
          {{ question.question }}
        </p>
        <div v-for="(choice, choiceIndex) in question.choices" :key="choiceIndex" class="mt-2">
          <input type="radio" :id="`q${index}_choice${choiceIndex}`" :value="choice" v-model="selectedAnswers[index]" />
          <label :for="`q${index}_choice${choiceIndex}`" class="pl-2">
            {{ choice }}
          </label>
        </div>
      </div>
      <button type="submit" class="bg-blue-500 text-white px-4 py-2 mt-4 rounded hover:bg-blue-600">
        Submit
      </button>
    </form>
    <p v-else>No questions available.</p>
  </Card>
</template>
  
<script lang="ts">
import { Question } from '~/types/quiz';

export default defineComponent({
  props: {
    title: String,
    questions: Array as () => Question[],
  },
  data() {
    return {
      selectedAnswers: this.questions ? this.questions.map(() => '') : [],
    };
  },
  methods: {
    getQuizScore(): void {
      let score = 0;
      if (!this.questions) return;
      // Compare selected answers with correct answers
      for (let i = 0; i < this.questions.length; i++) {
        if (this.selectedAnswers[i] === this.questions[i].correctOption) {
          score++;
        }
      } this.$router.push({
        path: '/result',
        query: { score },
      });
    },
  },
})
</script>
