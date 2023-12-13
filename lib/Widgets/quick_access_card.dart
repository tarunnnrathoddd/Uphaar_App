import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 2
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
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
    );
  }
}
