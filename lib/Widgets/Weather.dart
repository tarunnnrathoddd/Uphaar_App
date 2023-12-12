import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff81c3d8), Color(0xffffffff)],
          stops: [0.25, 0.75],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          const Expanded(
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
          SvgPicture.network('https://res.cloudinary.com/drpj8yeqp/image/upload/v1702401538/Uphaar_App/Rain_cloud_qdlwm2.svg')
        ],
      ),
    ) ;
  }
}
