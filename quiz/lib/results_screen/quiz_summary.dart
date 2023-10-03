class QuizSummary {
  const QuizSummary({
    required this.questionNumber,
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  final int questionNumber;
  final String question;
  final String selectedAnswer;
  final String correctAnswer;
}
