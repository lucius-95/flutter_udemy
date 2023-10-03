import 'package:flutter/material.dart';
import 'package:quiz/question_screen/question_screen.dart';
import 'package:quiz/question_screen/questions.dart';
import 'package:quiz/results_screen/results_screen.dart';
import 'package:quiz/start_screen/start_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum ScreenType { start, question, results }

class _MyAppState extends State<MyApp> {
  var screenType = ScreenType.start;
  List<String> selectedAnswers = [];

  Widget get activeScreen {
    return switch (screenType) {
      ScreenType.question => QuestionScreen(onSelectAnswer),
      ScreenType.results => ResultsScreen(selectedAnswers, onRestart),
      ScreenType.start || _ => StartScreen(onStartQuiz)
    };
  }

  void switchScreen(ScreenType type) => setState(() => screenType = type);

  void onStartQuiz() => switchScreen(ScreenType.question);

  void onSelectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      switchScreen(ScreenType.results);
    }
  }

  void onRestart() {
    selectedAnswers.clear();
    switchScreen(ScreenType.start);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
