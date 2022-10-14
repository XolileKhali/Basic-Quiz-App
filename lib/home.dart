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
              //...(_questions[_questionIndex]['answers']
                    //  as List<Map<String, Object>>)
                //  .map(
               // (answer) => Answer(
              //    answerText: 'answerText',answerColor: answer['score']?Colors.green:Colors.red,),),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Next Question'),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '0/9',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
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
