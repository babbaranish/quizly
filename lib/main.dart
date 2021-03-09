import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'bank.dart';

void main() => runApp(Quizzler());
Bank bank = Bank();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answerIcons = [];
  // ignore: missing_return
  bool checkAnswer(bool answerValue) {
    bool answerCheck = bank.getAnswer();
    setState(
      () {
        if (bank.isFinished()) {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
          ).show();
          bank.reset();
          answerIcons = [];
        } else {
          if (answerCheck == answerValue) {
            answerIcons.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            answerIcons.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
        }

        bank.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                bank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Row(
          children: answerIcons,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
