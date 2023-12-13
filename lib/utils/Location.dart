import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {
  Future<Map<String, String>> getLocation() async {
    // getting location information
    var locationPermission = await Permission.location.request();

    if(  !await locationPermission.isGranted ) {
      print("permission not granted");
      throw Exception("Location permission not granted");
    }

    Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.low );
    Map<String, String> temp = {};
    temp['lat'] = position.latitude.toString();
    temp['lon'] = position.longitude.toString();

    return temp;
  }
}