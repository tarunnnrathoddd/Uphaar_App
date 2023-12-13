import 'package:flutter/material.dart';
// import 'package:navbar/Screens/First.dart';
// import 'package:navbar/Screens/Second.dart';

class FeatureCard extends StatelessWidget {
  String text;
  String image;
  String webUrl;

  FeatureCard({
    super.key,
    required this.text,
    required this.image,
    required this.webUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: 150,
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
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only( left: 4.0),
                  child: Text(text),
                ),
                ElevatedButton(
                  onPressed: () {
                    // if(webUrl=="inferno") {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => First()
                    //     ),
                    //   );
                    // }
                    // else if(webUrl=="aushadh") {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => Second()
                    //     ),
                    //   );
                    // }
                    // else {
                    //   debugPrint("not implemented yet");
                    // }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all( Colors.blue ),
                    foregroundColor: MaterialStateProperty.all( Colors.white )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric( horizontal: 24.0),
                    child: Text("View Now"),
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ],
      ),
    );
  }
}
