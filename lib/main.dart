import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who played in the movie "Gladiator"?',
      'answers': [
        {'text': 'Brad Pit', 'score': -2},
        {'text': 'Jennifer Aniston', 'score': -2},
        {'text': 'Jennifer Lawrense', 'score': 10},
        {'text': 'Russel Crowe', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. In what year did WW2 End?',
      'answers': [
        {'text': '1949', 'score': -2},
        {'text': '1935', 'score': -2},
        {'text': '1966', 'score': -2},
        {
          'text':
          '1945',
          'score': 10
        },
      ],
    },
    {
      'questionText': ' Q3. Which major sport is mostly watched in Australia?',
      'answers': [
        {'text': 'Basketball', 'score': -2},
        {'text': 'Tennis', 'score': 10},
        {'text': 'Soccer', 'score': -2},
        {'text': 'Volleyball', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Which sea animal has infinite life?',
      'answers': [
        {'text': 'Lobster', 'score': 10},
        {'text': 'Crab', 'score': -2},
        {'text': 'Prawn', 'score': -2},
        {'text': 'Seal', 'score': -2},
      ],
    },
    {
      'questionText':
      'Q5. In which continent is Amazon Forest at?',
      'answers': [
        {
          'text': 'North America',
          'score': -2,
        },
        {'text': 'South America', 'score': 10},
      ],
    },
  ];
//
  var _questionIndex = 0;
  var _totalScore = 0;
//
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
//
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz

              : Result(_totalScore, _resetQuiz),
        )
    , //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}