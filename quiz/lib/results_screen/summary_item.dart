import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/results_screen/question_identifier.dart';
import 'package:quiz/results_screen/quiz_summary.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this._itemData, {super.key});

  final QuizSummary _itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = _itemData.selectedAnswer == _itemData.correctAnswer;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(_itemData.questionNumber, isCorrectAnswer),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _itemData.question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _itemData.selectedAnswer,
                style: TextStyle(color: isCorrectAnswer ? Colors.green : Colors.red),
              ),
              Text(
                _itemData.correctAnswer,
                style: const TextStyle(color: Colors.yellow),
              ),
            ],
          ),
        )
      ],
    );
  }
}
