class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final result = List.of(answers);
    result.shuffle();

    return result;
  }
}
