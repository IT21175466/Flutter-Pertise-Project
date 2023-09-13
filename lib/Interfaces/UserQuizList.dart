import 'package:flutter/material.dart';
import 'package:sexpertise/Interfaces/SingleLayouts/SingleQuestionTitle.dart';

class UserQuizList extends StatefulWidget {
  const UserQuizList({super.key});

  @override
  State<UserQuizList> createState() => _UserQuizListState();
}

class _UserQuizListState extends State<UserQuizList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizzes',
          style: TextStyle(
            fontSize: 23,
            color: Color.fromRGBO(0, 74, 173, 1),
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 244, 246, 255),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: const Color.fromARGB(255, 244, 246, 255),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleQuestionTitleCard(),
              SingleQuestionTitleCard(),
            ],
          ),
        ),
      ),
    );
  }
}
