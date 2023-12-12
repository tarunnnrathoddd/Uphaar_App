import 'package:flutter/material.dart';
import 'package:navbar/NavBar.dart';
import 'package:navbar/Widgets/FeatureCard.dart';
import 'package:navbar/Widgets/VideoContainer.dart';
import 'package:navbar/Widgets/Weather.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child:
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.alarm)),
          ),
          SizedBox(
            width: 4.0,
          ),
        ],
        title: Text('Uphaar'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherCard(),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Why Kawach?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            VideoContainer(),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Inferno Alert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Discover Nearest Fire Stations for Rapid Support",
              image: '',
              webUrl: 'inferno',
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Aushadh Ghar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Find Nearby Medical Centers for Quick Aid",
              image: '',
              webUrl: 'aushadh',
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Suraksha Chauki",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Your instant link to the closest police stations",
              image: '',
              webUrl: '',
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Helpline Number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
