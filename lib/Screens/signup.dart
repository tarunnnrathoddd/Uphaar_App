
import "package:flutter/material.dart";


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.only(top: 100), children: [
        Container(
          margin: EdgeInsets.only(left: 60),
          // child: _row1(),
        ),
        Container(
            margin: EdgeInsets.only(left: 140, top: 10, bottom: 05),
            child: Text("Sign Up",

                style: TextStyle(

                  color: Colors.black,
                  fontSize: 35,
                ))),
        Container(
          //padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
          margin: EdgeInsets.all(20),
          height: 360,
          width: 360,
          padding: EdgeInsets.only(top: 35, left: 18, right: 18),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 229, 227, 227),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(

            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: " Enter Name",
                        border: InputBorder.none,
                        hintStyle:
                        TextStyle(color: Colors.black, fontSize: 20)),
                    keyboardType: TextInputType.name,
                    validator: (input) =>
                    input!.isEmpty ? 'Please enter an email' : null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: ' Email Address',
                        border: InputBorder.none,
                        hintStyle:
                        TextStyle(color: Colors.black, fontSize: 20)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (input) =>
                    input!.isEmpty ? 'Please enter an email' : null,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle:
                        TextStyle(color: Colors.black, fontSize: 20)),
                    obscureText: true,
                    validator: (input) =>
                    input!.isEmpty ? 'Please enter a password' : null,

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color:  Color.fromARGB(255, 194, 71, 30),
                      borderRadius: BorderRadius.circular(5)),
                  //color: Colors.blueGrey,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 194, 71, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {  },
                    child: Text(
                      'Create Account ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //_container4(),
      ]),
    );
  }

  Container _container4() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 0),
        child: Column(
          children: [
            Text("If already registered ?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400)),
            Container(
                margin: EdgeInsets.only(right: 5),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          color: Color.fromARGB(255, 194, 71, 30),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )))
          ],
        ));
  }

// Row _row1() {
//   return Row(children: [
//     Image.asset("assets/images/logo2.png",
//         fit: BoxFit.contain, width: 90, height: 90),
//     Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.only(left: 10),
//         child: Text('HelpOut',
//             style: TextStyle(
//                 color: Color.fromARGB(255, 21, 20, 20),
//                 fontWeight: FontWeight.w400,
//                 fontSize: 40.0))),
//   ]);
}

