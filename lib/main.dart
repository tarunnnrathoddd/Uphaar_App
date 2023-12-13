import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:navbar/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDY59XxjzT5Q_T4ErR90EjNluUSZRldNOA",
      appId: "1:19956748708:android:3ede5cfad143a106bc7131",
      messagingSenderId: "19956748708",
      projectId: "first-53617",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
