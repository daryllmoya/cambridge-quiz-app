import { CourseRecommendation, Question } from "~/types/quiz";

export const quizQuestions: Question[] = [
  {
    question: "What is the capital of France?",
    choices: ["Paris", "London", "Berlin", "Madrid"],
    correctOption: "Paris",
  },
  {
    question: 'Who wrote the play "Romeo and Juliet"?',
    choices: [
      "Charles Dickens",
      "William Shakespeare",
      "Jane Austen",
      "Leo Tolstoy",
    ],
    correctOption: "William Shakespeare",
  },
  {
    question: 'Which planet is known as the "Red Planet"?',
    choices: ["Venus", "Mars", "Jupiter", "Saturn"],
    correctOption: "Mars",
  },
];

export const courseRecommendations: CourseRecommendation[] = [
  { score: 0, course: "B2 First, C1 Advanced" },
  { score: 1, course: "B2 First for Schools" },
  { score: 2, course: "B1 Preliminary for Schools, A2 Key for Schools" },
];
