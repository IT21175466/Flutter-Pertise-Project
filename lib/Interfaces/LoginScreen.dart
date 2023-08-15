import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            //Logo Section
            Container(
              height: screenHeight / 3 + AppBar().preferredSize.height,
              width: screenWidth,
              child: Image.asset('lib/Assets/Logo.jpeg'),
            ),

            //Input Section and Button
            Container(
              width: screenWidth,
              height: screenHeight / 3,
              child: Column(
                children: [
                  //TextField Email
                  Container(
                    width: screenWidth - 30,
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 0, 74, 173),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 74, 173),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //TextField Password
                  Container(
                    width: screenWidth - 30,
                    height: 55,
                    child: TextField(
                      obscureText: isSecurePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 0, 74, 173),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 74, 173),
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Password',
                        suffixIcon: togglePassword(),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //Forget Password
                  Container(
                    width: screenWidth,
                    child: Center(
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 74, 173),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  //Login Button
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SecondScreen()));
                    },
                    child: Container(
                      height: 55,
                      width: screenWidth - 30,
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
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Bottom Section
            Container(
              width: screenWidth,
              height: screenHeight / 3 - AppBar().preferredSize.height,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    child: Center(
                      child: Text(
                        'Or',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Center(
                      child: Text(
                        'Continue with',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 35,
                    width: 35,
                    child: Center(
                      child: Image.asset('lib/Assets/google.png'),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        Spacer(),
                        Text("Don't you have an account?"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 74, 173),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            isSecurePassword = !isSecurePassword;
          });
        },
        icon: isSecurePassword
            ? Icon(
                Icons.visibility,
                color: Color.fromARGB(255, 0, 74, 173),
              )
            : Icon(
                Icons.visibility_off,
                color: Color.fromARGB(255, 0, 74, 173),
              ));
  }
}
