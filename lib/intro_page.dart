import 'package:flutter/material.dart';

import 'quiz_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    navigateToQuizPage();
  }

  void navigateToQuizPage() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF5722), // Set your desired background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
            ),
            const SizedBox(height: 16),
            const Text(
              'Quizopia',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF), // Set your desired text color
              ),
            ),
            const Text(
              'Made by Anexo',
              style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
      ),
    );
  }
}
