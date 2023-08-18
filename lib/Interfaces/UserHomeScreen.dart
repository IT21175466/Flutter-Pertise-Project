import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userName;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    setState(() {
      isLoading = true;
    });
    User? user = _auth.currentUser;
    //_uid = user?.uid;
    print('${user!.email}');

    final DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();

    setState(() {
      userName = userDoc.get('Name');
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person_rounded,
          color: Color.fromARGB(255, 0, 74, 173),
        ),
        title: Row(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hello,",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 74, 173),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: isLoading
                      ? Text(
                          '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(
                          '$userName',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              Icons.notifications_outlined,
              size: 35,
              color: Color.fromARGB(255, 0, 74, 173),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 244, 246, 255),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Spacer(),
            //1st Row
            Row(
              children: [
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.library_books,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Chatbot',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Read Blogs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),

            Spacer(),

            //2nd Row
            Row(
              children: [
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.quiz,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Watch Videos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Quizzes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),

            //3rd Row
            Spacer(),

            Row(
              children: [
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.reviews,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 0, 74, 173),
                      size: 120,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Add Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 246, 255),
    );
  }
}
