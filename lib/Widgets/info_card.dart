import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String place;

  const InfoCard({
    Key? key,
    required this.name,
    required this.place
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric( horizontal: 8.0, vertical: 4.0, ),
      padding: const EdgeInsets.all( 8.0, ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 2
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(place),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const  Icon(
              Icons.phone_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined
            ),
          ),
        ],
      )
    );
  }
}
