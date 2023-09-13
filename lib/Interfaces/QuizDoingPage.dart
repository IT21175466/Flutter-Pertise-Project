import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizDoingPage extends StatefulWidget {
  final String quizID;
  const QuizDoingPage({super.key, required this.quizID});

  @override
  State<QuizDoingPage> createState() => _QuizDoingPageState();
}

class _QuizDoingPageState extends State<QuizDoingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question',
          style: TextStyle(
            fontSize: 23,
            color: Color.fromRGBO(0, 74, 173, 1),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 244, 246, 255),
      ),
      body: Container(
        color: Color.fromARGB(255, 244, 246, 255),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Text(
              '${widget.quizID}',
              style: TextStyle(
                fontSize: 5,
                color: Color.fromARGB(255, 244, 246, 255),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'loadedState.question[counter].question',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'loadedState.question[counter].optionOne',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'loadedState.question[counter].optionTwo',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'loadedState.question[counter].optionThree',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'loadedState.question[counter].optionFour',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        //QuestionTile(questionModel: loadedState.question[0]),
      ),
    );
  }
}
