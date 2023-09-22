export interface Question {
  question: string;
  choices: string[];
  correctOption: string;
}

export interface CourseRecommendation {
  score: number;
  course: string;
}
