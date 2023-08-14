import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person_rounded,
          color: Color.fromARGB(255, 0, 74, 173),
        ),
        title: SingleChildScrollView(
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
                    child: Text(
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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
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
                      Icons.people,
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
                      'Manage User',
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
                      Icons.library_books_outlined,
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
                      Icons.video_call,
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
                      'Manage Blogs',
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
                      'Manage Videos',
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
                      Icons.comment,
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
                      'Comments',
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
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 246, 255),
    );
  }
}
