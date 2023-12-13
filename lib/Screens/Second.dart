import 'package:flutter/material.dart';
import 'package:navbar/Widgets/info_card.dart';
class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
