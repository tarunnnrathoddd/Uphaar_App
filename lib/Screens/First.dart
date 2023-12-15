import 'package:flutter/material.dart';
import 'package:navbar/Widgets/info_card.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black38,
        automaticallyImplyLeading: true,
        title: Text(
          "Fire-Station",
          style: TextStyle(
            fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InfoCard(name: "Saras Bagh", place: "Venue lime, Pune"),
          InfoCard(name: "Saras Bagh", place: "Venue lime, Pune"),
          InfoCard(name: "Saras Bagh", place: "Venue lime, Pune"),
          InfoCard(name: "Saras Bagh", place: "Venue lime, Pune"),
          InfoCard(name: "Saras Bagh", place: "Venue lime, Pune"),


          Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://res.cloudinary.com/drpj8yeqp/image/upload/v1702401134/Uphaar_App/Uphaar_App_Logo-removebg-preview_wvrpvd.png",
                      width: 50,
                    ),
                    const Text(
                      "TEAM UPHAAR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5
                      ),
                    )
                  ],
                ),
              ),
          ),

          const SizedBox(
            height: 10,
          ),
        ],
      )
    );
  }
}
