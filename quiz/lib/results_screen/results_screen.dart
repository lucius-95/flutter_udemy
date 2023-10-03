import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/question_screen/questions.dart';
import 'package:quiz/results_screen/quiz_summary.dart';
import 'package:quiz/results_screen/summary_item.dart';

const questionNumber = 'questionNumber';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this._selectedAnswers, this._onRestart, {super.key});

  final List<String> _selectedAnswers;
  final void Function() _onRestart;

  List<QuizSummary> _getSummaryData() {
    final List<QuizSummary> result = [];

    for (int i = 0; i < _selectedAnswers.length; i++) {
      result.add(QuizSummary(
        questionNumber: i + 1,
        question: questions[i].question,
        selectedAnswer: _selectedAnswers[i],
        correctAnswer: questions[i].answers[0],
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = _getSummaryData();
    final correctQuestionsCount = summaryData.where((data) => data.selectedAnswer == data.correctAnswer).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestionsCount out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: summaryData.map((data) {
                    return SummaryItem(data);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: _onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
