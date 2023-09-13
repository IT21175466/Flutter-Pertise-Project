import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizDoingPage extends StatefulWidget {
  final String quizID;
  const QuizDoingPage({super.key, required this.quizID});

  @override
  State<QuizDoingPage> createState() => _QuizDoingPageState();
}

class _QuizDoingPageState extends State<QuizDoingPage> {
  @override
  void initState() {
    getData(widget.quizID);
    super.initState();
  }

  bool loading = false;

  String question = '';
  String answer01 = '';
  String answer02 = '';
  String answer03 = '';
  String answer04 = '';
  String correctAnswer = '';

  void showCorrectDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return CupertinoAlertDialog(
            content: Column(
              children: [
                Container(
                  child: Lottie.network(
                      'https://assets7.lottiefiles.com/packages/lf20_9aa9jkxv.json'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Your Anser is Correct!"),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            content: Container(
              height: 305,
              child: Column(
                children: [
                  Container(
                    child: Lottie.network(
                        'https://assets7.lottiefiles.com/packages/lf20_9aa9jkxv.json'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Your Anser is Correct!"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: const Text('OK'),
              ),

              // child: Text("OK"),
              // onPressed: () {
              //   Navigator.of(dialogContext).pop();
              // },
            ],
          );
        },
      );
    }
  }

  void getData(String uId) async {
    setState(() {
      loading = true;
    });
    final DocumentSnapshot questionDoc =
        await FirebaseFirestore.instance.collection("Questions").doc(uId).get();

    setState(() {
      question = questionDoc.get('Question');
      answer01 = questionDoc.get('Answer_01');
      answer02 = questionDoc.get('Answer_02');
      answer03 = questionDoc.get('Answer_03');
      answer04 = questionDoc.get('Answer_04');
      correctAnswer = questionDoc.get('Correct_Answer');
    });
    setState(() {
      loading = false;
    });
  }

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
                '$question',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                if (answer01 == correctAnswer) {
                  showCorrectDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your Answer is Wrong!")));
                }
              },
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
                    '$answer01',
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
              onTap: () {
                if (answer02 == correctAnswer) {
                  showCorrectDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your Answer is Wrong!")));
                }
              },
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(0, 74, 173, 1),
                      width: 1.5,
                    )),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$answer02',
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
              onTap: () {
                if (answer03 == correctAnswer) {
                  showCorrectDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your Answer is Wrong!")));
                }
              },
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
                    '$answer03',
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
              onTap: () {
                if (answer04 == correctAnswer) {
                  showCorrectDialog();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Your Answer is Wrong!")));
                }
              },
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
                    '$answer04',
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
      ),
    );
  }
}
