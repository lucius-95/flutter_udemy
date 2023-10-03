import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this._text, this._onClick, {super.key});

  final String _text;
  final void Function() _onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onClick,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        _text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
