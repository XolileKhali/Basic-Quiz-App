import 'dart:html';

import 'package:flutter/material.dart';

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
      _scoreTracker.add(answerScore ? Icon(Icons.check_circle,
      color: Colors.green,
      ) : Icon(Icons.clear,
        color: Colors.red,
      ),

    );
  });

    // When the quiz ends
    if (_questionIndex + 1 == _questions.length){
      endOfQuiz = true;
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
                  if (_scoreTracker.length == 0) SizedBox(height: 25.0),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    _questions[_questionIndex]['question'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['answerText'],
                  answerColor: answerWasSelected
                      ? answer['score']
                          ? Colors.green
                          : Colors.red
                      : null,
                  answerTap: () {_qustionAnswered(answer['score']);
                    },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(endOfQuiz? 'Restart Quiz':'Next Question'),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${_questions.length},
                  ,style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
              )
            ],
          ),
        ));
  }
}

List<Map<String, dynamic>> _questions = const [
  {
    'question': 'Is Mount Kilimanjaro the world’s tallest peak? ',
    'answers': [
      {'answerText': 'Yes is it', 'score': true},
      {'answerText': 'Ey I dont really know', 'score': false},
      {'answerText': 'No Mount Everast is the tallest peak', 'score': false},
    ],
  },
  {
    'question': 'Venezuela is home to the world’s highest waterfall. ',
    'answers': [
      {'answerText': 'Yes is it', 'score': true},
      {'answerText': 'Ey I dont really know', 'score': false},
      {'answerText': 'No Zimbabwe is', 'score': false},
    ],
  },
  {
    'question': 'Coffee is a berry-based beverage. ',
    'answers': [
      {'answerText': 'Yes is it', 'score': true},
      {'answerText': 'Ey I dont really know', 'score': false},
      {'answerText': 'No coffee is coffee', 'score': false},
    ],
  },
];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

