import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('25 C',
               style: TextStyle(fontSize: 30),
                ),


                Text('Pune, India',
                style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')
        ],
      ),
    ) ;
  }
}
