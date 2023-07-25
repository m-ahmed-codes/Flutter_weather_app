// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:weather_app/Screen/Forecast.dart';
// import 'package:weather_app/statticFile.dart';
import 'package:weather_app/model/Model.dart';
// import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  Root weather;

  HomePage({required this.weather});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map dataList = {};

  // Future getData() async {
  //   final response = await http.get(Uri.parse(
  //       "https://api.weatherapi.com/v1/forecast.json?key=4977308cbf864a1986a75043231207&q=London&days=1&aqi=yes&alerts=no"));
  //   // List forecast = [];
  //   dataList = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     // Weatherlist = dataList.map((e) => Data.fromJson(e)).toList();
  //     // Weatherlist = Weatherlist;
  //     // print("${dataList} ");
  //     // forecast = dataList. ;
  //     // forecast = dataList['forecast']['forecastday'];
  //     // forecast.forEach((element) {
  //     //   print(element['date']);
  //     // });
  //     // print("${forecast} ");
  //     // dataList.forEach((key, value) {
  //     // });
  //     // mapData = mapResponse['location'];
  //     // print("${dataList.map((key, value) => )}");
  //   }
  //   // print("${forecast.length}");
  // }

  @override
  void initState() {
    print("object");

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Forecastday?>? forecastday = [];

    if (widget.weather.forecast!.forecastday != null) {
      for (var i = 0; i < widget.weather.forecast!.forecastday!.length; i++) {
        if (widget.weather.forecast!.forecastday != null) {
          forecastday.add(widget.weather.forecast!.forecastday![i]);
        }
        // print(forecastday.length);
      }
    }

    //   for (var element in widget.weather.forecast!.forecastday!) {
    //     if (widget.weather.forecast!.forecastday != null) {
    //       element?.hour?.forEach((element) {
    //         hourWeather.add(element);
    //       });
    //     }
    //   }
    // }
    // print("object:: ${widget.weather.forecast!.forecastday![0]}");

    String currentTime =
        DateFormat("HH:mm:ss").format(DateTime.now()).substring(0, 2);

    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff060720),
      body: widget.weather.location?.name != null
          ? Container(
              height: myHeight,
              width: mywidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  widget.weather.location!.name == null
                      ? Text(
                          "Loading",
                          style: TextStyle(fontSize: 30),
                        )
                      : Text(
                          "${widget.weather.location!.name}",
                          style: TextStyle(fontSize: 30),
                        ),
                  SizedBox(
                    height: 25,
                  ),
                  widget.weather.location!.localtime == null
                      ? Text("Loading", style: TextStyle(fontSize: 18))
                      : Text(
                          "${widget.weather.location!.localtime!.substring(0, 10)}",
                          style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Center(child: Text('Forecast')),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 21, 85, 169),
                                    Color.fromARGB(255, 44, 162, 246)
                                  ])),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              child: Center(
                                child: Text("Air Quality"),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Image.network(
                      "https:${widget.weather.current?.condition?.icon}",
                      scale: .3),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text("Temp"),
                                widget.weather.current!.tempc == null
                                    ? Text("Loading")
                                    : Text(
                                        "${widget.weather.current!.tempc.toString()}"),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text("Temp"),
                                widget.weather.current!.windkph == null
                                    ? Text("Loading")
                                    : Text(
                                        "${widget.weather.current!.windkph.toString()} km/h"),
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text("Temp"),
                                widget.weather.current!.humidity == null
                                    ? Text("Loading")
                                    : Text(
                                        "${widget.weather.current!.humidity.toString()} km/h"),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Today", style: TextStyle(fontSize: 20)),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(context,
                              //     MaterialPageRoute(builder: (context) {
                              //   return ForecastPage();
                              // }));
                            },
                            child: Text(
                              "View Full report",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    child: Container(
                      height: 50,
                      // color: Colors.purpleAccent,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          // Get the current time
                          DateTime now = DateTime.now();
                          int currentTime = now.hour;

                          // Calculate the index of the first item based on the current time
                          int firstItemIndex = currentTime + index;
                          int i = 0;
                          if (firstItemIndex >= 24) {
                            // Handle wrapping around to the next day
                            firstItemIndex -= 24;
                            i = 1;
                          }

                          // Access the weather data for the current index
                          var weatherData =
                              forecastday[i]?.hour?[firstItemIndex];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      "https:${weatherData?.condition?.icon}"),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${weatherData?.time?.substring(11)}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      // Text(
                                      //   "${weatherData?.time?.substring(5, 10)}",
                                      //   style: TextStyle(color: Colors.white),
                                      // ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${weatherData?.tempc}C",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(.05),
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
