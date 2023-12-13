import 'package:flutter/material.dart';
import 'package:navbar/Screens/signup.dart';
// import 'dart:async';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 248, 248),
        body: ListView(padding: EdgeInsets.only(top: 110), children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              child: Text('UPHAAR',
                  style: TextStyle(
                      color: Color.fromARGB(255, 21, 20, 20),
                      fontWeight: FontWeight.w400,
                      fontSize: 40.0))),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Image.network(
                "https://res.cloudinary.com/drpj8yeqp/image/upload/v1702401134/Uphaar_App/Uphaar_App_Logo-removebg-preview_wvrpvd.png",
                fit: BoxFit.contain,
                width: 110,
                height: 110),
          ),
          _container3(context),
          _container4(context),
        ]));
  }
}

Container _container4(context) {
  return Container(
      margin: EdgeInsets.only(top: 20, bottom: 0),
      child: Column(
        children: [
          Text("If not a member ?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
          Container(
              margin: EdgeInsets.only(right: 5),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    "Register here",
                    style: TextStyle(
                        color: Color.fromARGB(255, 19, 28, 211),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  )))
        ],
      ));
}

Container _container3(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(top: 15),
      height: 360,
      width: 360,
      padding: EdgeInsets.only(top: 25, left: 18, right: 18),
      decoration: BoxDecoration(
          //color :Color.fromARGB(255, 211, 209, 209),
          //borderRadius: BorderRadius.circular(10),
          ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 320,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 50,
            width: 320,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 190, top: 10),
              child: TextButton(
                onPressed: () {},
                child: Text("Forget Password?",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 19, 28, 211),
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 19, 28, 211),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      )
                  ),
                  onPressed: () {},
                  child: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      )))),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Or sign in with",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implement Google login logic here
                      },
                      icon: Icon(Icons.g_translate), // Replace with Google logo
                      label: Text("Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 79, 54, 244), // Customize button color
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Implement Facebook login logic here
                      },
                      icon: Icon(Icons.facebook), // Replace with Facebook logo
                      label: Text("Facebook"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Customize button color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ));
}
