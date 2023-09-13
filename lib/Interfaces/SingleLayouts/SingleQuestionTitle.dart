import 'package:flutter/material.dart';

class SingleQuestionTitleCard extends StatefulWidget {
  final String quizNum;
  const SingleQuestionTitleCard({super.key, required this.quizNum});

  @override
  State<SingleQuestionTitleCard> createState() =>
      _SingleQuestionTitleCardState();
}

class _SingleQuestionTitleCardState extends State<SingleQuestionTitleCard> {
  String? quizNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color.fromRGBO(0, 74, 173, 1),
          width: 2,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text(
              'Question',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${widget.quizNum}',
              style: TextStyle(
                fontSize: 5,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 244, 246, 255),
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
