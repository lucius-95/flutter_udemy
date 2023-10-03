import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/question_screen/answer_button.dart';
import 'package:quiz/question_screen/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this._onSelectAnswer, {super.key});

  final void Function(String answer) _onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    widget._onSelectAnswer(answer);

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...question.shuffledAnswers.map((answer) => AnswerButton(answer, () => answerQuestion(answer))),
          ],
        ),
      ),
    );
  }
}
