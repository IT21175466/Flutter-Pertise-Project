import 'package:flutter/material.dart';

class SingleQuestionTitleCard extends StatefulWidget {
  const SingleQuestionTitleCard({super.key});

  @override
  State<SingleQuestionTitleCard> createState() =>
      _SingleQuestionTitleCardState();
}

class _SingleQuestionTitleCardState extends State<SingleQuestionTitleCard> {
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
              'Question 1',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
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
