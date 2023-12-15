import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickAccessCard extends StatelessWidget {
  final String helplineNumber;
  final String description;
  final IconData icon; // New parameter for the icon
  final bool border;

  const QuickAccessCard({
    Key? key,
    required this.helplineNumber,
    required this.description,
    required this.icon,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      margin: const EdgeInsets.all(2.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () async {
            String url = "tel:$helplineNumber";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.all(2.0),
            padding: const EdgeInsets.all(4.0),
            height: 100,
            child: Row(
              children: [
                Icon(
                  icon, // Use the icon parameter here
                  size: 42,
                ),
                Container(
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Flexible(
                          child: Text(
                              description,
                          ),
                        ),
                      )
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
