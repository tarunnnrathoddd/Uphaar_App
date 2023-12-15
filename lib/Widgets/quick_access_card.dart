import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class QuickAccessCard extends StatelessWidget {
  final String helplineNumber;
  final String description;

  const QuickAccessCard({
    Key? key,
    required this.helplineNumber,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () async {
            const url = "tel:1234567";
            if (await canLaunch(url)) {
            await launch(url);
            } else {
            throw 'Could not launch $url';
            }
          },
          child: Container(
            margin: const EdgeInsets.all(2.0),
            height: 100,
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 42,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        helplineNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(description)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
