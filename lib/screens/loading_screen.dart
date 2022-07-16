import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

// body: Center(
//   child: ElevatedButton(
//     onPressed: () {
//       //Get the current location
//       getLocationData();
//     },
//     child: Text('Get Location'),
//   ),
// ),

// void somethingThatExpectsLessThan10(int n) {
//   if (n > 10) {
//     throw 'n is greater than 10,n should be less than 10';
//   }
// }

// String myMargin = '30.0';
// double? myMarginAsADouble;
// try {
//   myMarginAsADouble = double.parse((myMargin));
// } catch (e) {
//   print(e);
// }

// body: SafeArea(
// child: Container(
// margin:
// EdgeInsets.all(myMarginAsADouble ?? 10.0), //Null aware operator
// color: Colors.red,
// ),
// ),

// var longitude = jsonDecode(data)['coord']['lon'];
// print(longitude);
// var weatherDescription = jsonDecode(data)['weather'][0]['description'];
// print(weatherDescription);
