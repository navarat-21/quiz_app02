import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      _totalScore += 1;
    }

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  //คำถาม
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': '1.เมื่องหลวงของญี่ปุ่นคือ?',
      'answers': [
        {'text': 'เกียวโต', 'isCorrect': false},
        {'text': 'โตเกียว', 'isCorrect': true},
        {'text': 'โอซาก้า', 'isCorrect': false},
        {'text': 'ฮอกไกโด', 'isCorrect': false},
      ],
    },
    {
      'questionText': '2.ญี่ปุ่นตั้งอยู่ในทวีปใด?',
      'answers': [
        {'text': 'ทวีปออสเตรเลีย', 'isCorrect': false},
        {'text': 'ทวีปอเมริกาใต้', 'isCorrect': false},
        {'text': 'ทวีปยุโรป', 'isCorrect': false},
        {'text': 'เอเชีย', 'isCorrect': true},
      ],
    },
    {
      'questionText': '3.เกาะที่ใหญ่ที่สุดในญี่ปุ่นคือที่ใด?',
      'answers': [
        {'text': 'ชิค็อกุ', 'isCorrect': false},
        {'text': 'ฮอนชู', 'isCorrect': true},
        {'text': 'คิวชู', 'isCorrect': false},
        {'text': 'โอกินาว่า', 'isCorrect': false},
      ],
    },
    {
      'questionText': '4.สัตว์ประจำชาติของญี่ปุ่นคือ?',
      'answers': [
        {'text': 'นกกระเรียน', 'isCorrect': true},
        {'text': 'ปลาคาร์ฟ', 'isCorrect': false},
        {'text': 'แมว', 'isCorrect': false},
        {'text': 'อีกา', 'isCorrect': false},
      ],
    },
    {
      'questionText': '5.ภูเขาสูงสุดในญี่ปุ่นคืออะไร?',
      'answers': [
        {'text': 'คิริชิมะ', 'isCorrect': false},
        {'text': 'ซุกูระจิมา', 'isCorrect': false},
        {'text': 'ฟูจิ', 'isCorrect': true},
        {'text': 'อันนาปุระ', 'isCorrect': false},
      ],
    },
    {
      'questionText': '6.ญี่ปุ่นมีกี่จังหวัด?',
      'answers': [
        {'text': '47', 'isCorrect': true},
        {'text': '45', 'isCorrect': false},
        {'text': '49', 'isCorrect': false},
        {'text': '43', 'isCorrect': false},
      ],
    },
    {
      'questionText': '7.ซากุระจะบานในช่วงเดือนอะไร?',
      'answers': [
        {'text': 'เมษา-พฤษภา', 'isCorrect': true},
        {'text': 'พฤศจิกา-ธันวา', 'isCorrect': false},
        {'text': 'กรกฎา-สิงหา', 'isCorrect': false},
        {'text': 'มกรา-กุมภา', 'isCorrect': false},
      ],
    },
    {
      'questionText': '8.อาหารขึ้นชื่อของญี่ปุ่นคือ?',
      'answers': [
        {'text': 'ซาชิมิ', 'isCorrect': false},
        {'text': 'ซูชิ', 'isCorrect': true},
        {'text': 'ราเม็ง', 'isCorrect': false},
        {'text': 'เทมปุระ', 'isCorrect': false},
      ],
    },
    {
      'questionText': '9.วัดที่ดังที่สุดในญี่ปุ่นคือที่ใด?',
      'answers': [
        {'text': 'โตโดจิ', 'isCorrect': false},
        {'text': 'โคโยทิ', 'isCorrect': false},
        {'text': 'ฟูจิซาวะ', 'isCorrect': false},
        {'text': 'เซ็นโซจิ', 'isCorrect': true},
      ],
    },
    {
      'questionText': '10.ญี่ปุ่นจังหวัดอะไรมีประชากรมากที่สุด?',
      'answers': [
        {'text': 'โอซาก้า', 'isCorrect': false},
        {'text': 'เกียวโต', 'isCorrect': false},
        {'text': 'โตเกียว', 'isCorrect': true},
        {'text': 'ฮอกไกโด', 'isCorrect': false},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      backgroundColor: Color(0xFFBBDEFB), //พื้นหลัง
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore, _resetQuiz),
    );
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final Function(bool) answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch, 
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        SizedBox(height: 20), //ขนาดช่อง
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(
            () => answerQuestion(answer['isCorrect'] as bool),
            answer['text'] as String,
          );
        }).toList(),
      ],
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), //ช่องคำตอบให้อยู่ห่างกัน
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore == 0) {
      resultText = 'Better luck next time!';
    } else if (resultScore == 10) {
      resultText = 'Congratulations, you got all correct!';
    } else {
      resultText = 'You got $resultScore out of 10 correct answers.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}