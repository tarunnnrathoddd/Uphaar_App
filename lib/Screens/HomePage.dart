import 'dart:io';

import 'package:flutter/material.dart';
import 'package:navbar/Widgets/NavBar.dart';
import 'package:navbar/Widgets/FeatureCard.dart';
import 'package:navbar/Widgets/VideoContainer.dart';
import 'package:navbar/Widgets/Weather.dart';
import 'package:navbar/Widgets/quick_access_card.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:navbar/common/models/repository.dart';
import 'package:navbar/common/models/user.dart';
import 'package:navbar/utils/constants.dart';
import 'package:navbar/utils/hive_service.dart';

class MyHomePage extends StatefulWidget {
  String? phoneNumber;

  MyHomePage({
    Key? key,
    this.phoneNumber
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? deviceId;
  HiveService hiveService = HiveService();

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
    updateRepositories();
  }

  void getDeviceInfo() async {
    deviceId = await _getId();
    debugPrint("unique Id : " + deviceId.toString());

    // now sending this ID to a API if there is no token in the system
    bool exists = await hiveService.isExists(boxName: 'user_data');

    if( !exists ) {
      // we will get a token in response, saving it to local hive storage
      User userData = User(number: '77569567888', token: 'abcdefg');

      hiveService.addBoxes<User>([userData], "user_data");
      kUserToken = userData.token;
    }
    else {
      final List<User> userData = await hiveService.getBoxes<User>('user_data');
      kUserToken = userData[0].token;
    }

    debugPrint( kUserToken );
  }

  void updateRepositories() async {
    bool exists = await hiveService.isExists(boxName: 'repository');

    if( !exists ) {
      // if the box does not exists we will create a new object of repository and save it locally with
      // the current data
      final Repository repo = Repository(fireStations: [], hospitals: [], policeStations: [], lastUpdated: DateTime.now() );
      await hiveService.addBoxes( [repo], 'repository' );

      debugPrint( "if" );
    }
    else {
      // if the box exists we will check the time difference between current time and last time
      DateTime now = DateTime.now();
      final List<Repository> repos = await hiveService.getBoxes<Repository>('repository');
      Duration diff = now.difference( repos.first.lastUpdated );

      // checking if difference is greater than 24 hours
      if( diff.inHours > 24 ) {
        // then updating the box with new data
        await hiveService.deleteBox('repository');
        final Repository repo = Repository(fireStations: [], hospitals: [], policeStations: [], lastUpdated: DateTime.now() );
        await hiveService.addBoxes([repo], 'repository' );
        debugPrint("Times up now time to update!");
      }
      else {
        debugPrint("Let him cook!");
      }

      debugPrint( "difference$diff" );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 2
            ),
          ],
          color: Colors.white,
        ),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: IconButton(
            onPressed: () {
              debugPrint("open camera");
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 42,
            ),
          )
        )
      ),
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child:
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.alarm)),
          ),
          const SizedBox(
            width: 4.0,
          ),
        ],
        title: Text('Uphaar'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherCard(),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Why Kawach?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            VideoContainer(),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Inferno Alert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Discover Nearest Fire Stations for Rapid Support",
              image:
                  'https://res.cloudinary.com/drpj8yeqp/image/upload/v1702409320/svg%20to%20png/Fireman_ws3tum_everjg.png',
              webUrl: 'inferno',
            ),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Aushadh Ghar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Find Nearby Medical Centers for Quick Aid",
              image:
                  'https://res.cloudinary.com/drpj8yeqp/image/upload/v1702409321/svg%20to%20png/Hospital_building_jar_of_pills_stethoscope_and_heart_with_a_cardiogram_cj7n7y_jiz8vg.png',
              webUrl: 'aushadh',
            ),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Suraksha Chauki",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            FeatureCard(
              text: "Your instant link to the closest police stations",
              image:
                  'https://res.cloudinary.com/drpj8yeqp/image/upload/v1702409321/svg%20to%20png/Police_isrsec_z04wfg.png',
              webUrl: 'suraksha',
            ),

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Text(
                "Helpline Number",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(
                8.0,
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                      QuickAccessCard(
                        helplineNumber: "1091",
                        description: "Woman Helpline",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://res.cloudinary.com/drpj8yeqp/image/upload/v1702401134/Uphaar_App/Uphaar_App_Logo-removebg-preview_wvrpvd.png",
                  width: 50,
                ),
                Text(
                  "TEAM UPHAAR",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 5),
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
