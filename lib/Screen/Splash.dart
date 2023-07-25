import 'dart:async';
// import 'dart:convert';
// import 'dart:js_interop';
//import 'dart:js';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/api_service.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/ErrorModel.dart';
import 'package:weather_app/model/Model.dart';
// import 'package:http/http.dart' as http;
import 'package:weather_app/statticFile.dart';
// import 'package:weather_app/model/Model.dart';

class SplashPage extends StatefulWidget {
  // const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SpashpageState();
}

dynamic obj;

Root root = Root();

// List<Hour?>? hourWeather = [];

class _SpashpageState extends State<SplashPage> {
  Map data = {};

  callFuture() async {
    await FetchApi().getData().whenComplete(() {
      Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      root: root,
                    )));
      });
    });
  }

  @override
  void initState() {
    super.initState();

    callFuture();

    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
    // print("alalalla ${data}");
    // print("alalallalllllllllllllllll ${root.location?.name}");
    // });
    // setState(() {
    // if (data != null) {
    //   for (var element in root.forecast!.forecastday!) {
    //     if (root.forecast!.forecastday != null) {
    //       element?.hour?.forEach((element) {
    //         hourWeather?.add(element);
    //       });
    //     }
    //   }
    // }
    // });
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        color: Color(0xff060720),
        width: mywidth,
        height: myHeight,
        child: data['location'] == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to Weather app",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                  SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Colors.blue.shade400,
                  )
                ],
              )
            : Text(data['location']['name']),
      ),
    );
  }
}

// Data dad
class FetchApi {
  String user_location = 'myAddress';
  Position? currentPosition;
  int days = 7;

  Map apiData = {};

  Map weather = {};

  Future getDaysData() async {
    await _determinePosition();

    PostApiService postapiService;
    Root rootDays = Root();

    postapiService = PostApiService.create();
    Response response =
        await postapiService.getDaysPosts(country: user_location, days: days);

    if (response.statusCode == 200) {
      print("response body${response.statusCode}");
      var res = response.body;
      // res = jsonDecode();
      rootDays = Root.fromJson(res);

      return rootDays;
    } else {
      print(response.error);
    }
  }

  Future getManyCountryData(String location) async {
    // await _determinePosition();

    PostApiService postapiService;

    postapiService = PostApiService.create();
    Response response = await postapiService.getPosts(country: location);
    Root countriesWeather = Root();

    var res = response.body;
    if (response.statusCode == 200) {
      print("response body${response.statusCode}");

      countriesWeather = Root.fromJson(res);
      return countriesWeather;
    } else {
      return response.error;
    }
  }

  Future getSearchCountryData(String location) async {
    // await _determinePosition();

    PostApiService postapiService;

    postapiService = PostApiService.create();
    Response response = await postapiService.getPosts(country: location);
    // Root countriesWeather = Root();

    // var res = response.body;
    if (response.statusCode == 200) {
      print("response body${response.statusCode}");

      // countriesWeather = Root.fromJson(res);
      return response;
    } else {
      return response;
    }
  }

  Future getData() async {
    await _determinePosition();

    PostApiService postapiService;

    postapiService = PostApiService.create();
    Response response = await postapiService.getPosts(country: user_location);

    if (response.statusCode == 200) {
      // print("response body${response.statusCode}");
      var res = response.body;
      // res = jsonDecode();

      root = Root.fromJson(res);
    } else {
      print(response.error);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please keep your location on');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(
            msg: 'Permission is denied and defualt location is set');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg: 'Permission is denied Forever and defualt location is set');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      // setState(() {
      currentPosition = position;
      user_location = "${place.locality}";
      Weather.location = user_location;
      // });
    } catch (e) {
      print(e);
    }
    return position;
  }
}



// final response = await http.get(Uri.parse(
    //     "https://api.weatherapi.com/v1/forecast.json?key=4977308cbf864a1986a75043231207&q=${user_location}&days=1&aqi=yes&alerts=no"));
    // if (response.statusCode == 200) {
    //   apiData = jsonDecode(response.body);
    //   weather = apiData['location'];
    //   // Weather LocData = Weather(Location_data: weather);
    //   // return LocData;
    //   // print("data : ${data}");
    //   // weather.add(data);
    // } else {
    //   data = {};
    // }