import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished()) {
        int correctAnswers = scoreKeeper
                .where((icon) => icon.color == Color(0xFF4CAF50))
                .length +
            1;
        int totalQuestions = quizBrain.getQuestionBankLength();
        Alert(
          context: context,
          style: AlertStyle(backgroundColor: Colors.grey[700]),
          type: AlertType.success,
          title: "Quiz Finished",
          desc:
              "You have answered $correctAnswers out of $totalQuestions questions correctly.",
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color(0xFF9E9E9E),
              width: 120,
              child: const Text(
                "Restart",
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
              ),
            ),
          ],
        ).show();
        scoreKeeper = [];
        quizBrain.reset();
      } else {
        if (userAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Color(0xFF4CAF50),
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Color(0xFFF44336),
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                10.0,
              ),
              child: MaterialButton(
                color: Color(0xFF4CAF50),
                child: const Text(
                  "እዉንት",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                10.0,
              ),
              child: MaterialButton(
                color: Color(0xFFF44336),
                child: const Text(
                  "ሃሰት",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
