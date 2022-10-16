import 'package:flutter/material.dart';
import 'question_database.dart';
import 'Answer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;

  void _qustionAnswered(bool answerScore) {
    setState(() {
      // answer was selected
      answerWasSelected = true;
      // check if answer was correct
      if (answerScore) {
        _totalScore++;
      }
      // adding to the score tracker on top
      _scoreTracker.add(
        answerScore
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );
    });

    // When the quiz ends
    if (_questionIndex + 1 == questions.length) {
      endOfQuiz = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Quiz App',
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  if (_scoreTracker.isEmpty) const SizedBox(height: 25.0),
                  if (_scoreTracker.isNotEmpty) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(
                    bottom: 10.0, left: 30.0, right: 30.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    questions[_questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(questions[_questionIndex]['answers']
                      as List<Map<String, dynamic>>)
                  .map(
                (answer) => AnswerCardDisplay(
                  answerText: answer['answerText'],
                  answerColor: answerWasSelected
                      ? answer['isCorrect']
                          ? Colors.green
                          : Colors.red
                      : Colors.grey,
                  answerTap: () {
                    _qustionAnswered(answer['isCorrect']);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${questions.length}',
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
