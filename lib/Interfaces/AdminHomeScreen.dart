import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sexpertise/Interfaces/Admin/ArticleListPage.dart';
import 'package:sexpertise/Interfaces/AdminQuizList.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? adminName;
  bool isLoading = false;

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
      adminName = userDoc.get('Name');
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    //getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person_rounded,
          color: Color.fromARGB(255, 0, 74, 173),
        ),
        title: const SingleChildScrollView(
          child: Row(
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
                    child:
                        // isLoading
                        //     ? Text(
                        //         '',
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //       )
                        //     :
                        Text(
                      //'$adminName',
                      "Admin",
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
        ),
        backgroundColor: const Color.fromARGB(255, 244, 246, 255),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            const Spacer(),
            //1st Row
            Row(
              children: [
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/Assets/chatbot.png'),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/Assets/group.png'),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Chatbot',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Manage User',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),

            const Spacer(),

            //2nd Row
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleListAdmin()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 35),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('lib/Assets/blogging.png'),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/Assets/video.png'),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Manage Blogs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Manage Videos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),

            //3rd Row
            const Spacer(),

            //2nd Row
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminQuizList()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 35),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('lib/Assets/quiz.png'),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('lib/Assets/settings.png'),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Quizzes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 150,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 246, 255),
    );
  }
}
