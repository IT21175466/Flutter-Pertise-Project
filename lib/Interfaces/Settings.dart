import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 74, 173),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text(
              "Jonathan Patterson",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const Text(
              "hello@reallygreatsite.com",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Name
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Name :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Jonathan Patterson",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //Password
            const Row(
              children: [
                Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Password :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "*******",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //Re-type Password
            const Row(
              children: [
                Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Re-Type Password :",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "*******",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //Birthday
            const Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Birthday",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "23rd October 1993",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //Mobile No
            const Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Mobile No",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "0701234567",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 15,
            ),

            //Address
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 0, 74, 173),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Address",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "127/B, City Rd, Town",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 25,
            ),

            //Save Button
            Container(
              height: 55,
              // width: screenWidth - 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 35, 60, 135),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 4.0,
                    color: Color.fromARGB(63, 0, 0, 0),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
