import 'package:flutter/material.dart';
import 'package:navbar/utils/Location.dart';
import 'package:navbar/utils/WeatherData.dart';
import 'package:navbar/utils/constants.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  Map<String, dynamic> weatherData = {};
  bool takeLocationFromCoords = true;
  bool failedToLoad = false;
  bool reloading = true ;

  Future<bool> loadWeatherByCoords( ) async  {
    if( takeLocationFromCoords == false ) {
      reloading = false;
      setState(() { });
      return true;
    }

    // new instance of Location to get user location
    Location userLocation = Location();
    Map<String, String> location = {};

    try{
      location = await userLocation.getLocation();
    }
    catch( e, stacktrace  ) {
      print( e );
      print( stacktrace );

      failedToLoad = true ;
      reloading = false ;
      setState(() { });
    }

    WeatherData currentWeather = WeatherData();
    await currentWeather.loadData( latitude: location['lat']!, longitude: location['lon']! );

    // checking if the weather has been loaded from the server
    if( currentWeather.gotWeather == false ){
      failedToLoad = true ;
      reloading = false;
      setState(() { });
      return true ;
    }
    else {
      weatherData = currentWeather.getWeather();
      failedToLoad = false;
      reloading = false;
      setState(() { });
      return true;
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getWeather();
  }

  void getWeather() async {
    await loadWeatherByCoords();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint( weatherData.toString() );
    debugPrint("test");

    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff81c3d8), Color(0xffffffff)],
            stops: [0.25, 0.90],
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text( '${( reloading || failedToLoad ? '- -' : weatherData['temperature'] )}°C',
                  style: TextStyle(fontSize: 30),
                ),


                Text( '${(reloading || failedToLoad ? '' : weatherData['city'])}, ${(reloading || failedToLoad ? '' : weatherData['country'])}',
                  style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0 ),
            child: Image.asset(
            ( reloading || failedToLoad ? 'assets/weather_scatteredClouds3D.png' : "assets/${kWeatherCondition[weatherData['weather']]}" ),
              width: 100,
            ),
          ),
        ],
      ),
    ) ;
  }
}



