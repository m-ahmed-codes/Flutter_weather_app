import 'package:flutter/material.dart';
import 'package:weather_app/Screen/Splash.dart';
import 'package:weather_app/model/Model.dart';

import 'package:intl/intl.dart';

class ForecastPage extends StatefulWidget {
  Root weather;
  ForecastPage({required this.weather});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

FetchApi fetchApi = FetchApi();

Root Rootdays = Root();

class _ForecastPageState extends State<ForecastPage> {
  @override
  void initState() {
    getDaysData();
    super.initState();
  }

  List<Forecastday?>? forecastday = [];
  List<Day?>? days = [];
  List? dates = [];

  Future<void> getDaysData() async {
    Rootdays = await fetchApi.getDaysData();
    if (widget.weather.forecast!.forecastday != null) {
      for (var i = 0; i < widget.weather.forecast!.forecastday!.length; i++) {
        if (widget.weather.forecast!.forecastday != null) {
          setState(() {
            forecastday!.add(widget.weather.forecast!.forecastday![i]);
          });
        }
        // print(forecastday.length);
      }
    }

    // This is for to add day data in days list
    if (Rootdays.forecast!.forecastday != null) {
      for (var i = 0; i < Rootdays.forecast!.forecastday!.length; i++) {
        if (Rootdays.forecast!.forecastday != null) {
          setState(() {
            days!.add(Rootdays.forecast!.forecastday![i]!.day);
          });
        }
        // print(days.length);
      }
    }

    // This is for to add dates data in dates list
    if (Rootdays.forecast!.forecastday != null) {
      for (var i = 0; i < Rootdays.forecast!.forecastday!.length; i++) {
        if (Rootdays.forecast!.forecastday != null) {
          setState(() {
            dates!.add(Rootdays.forecast!.forecastday![i]!.date);
          });
        }
      }
    }

    // String currentTime = DateFormat("EEEE").format(days[0] as DateTime);

    // setState(() {
    //   String dateStr = dates![0].toString();
    //   DateTime date = DateTime.parse(dateStr);

    //   String weekday = DateFormat('EEEE').format(date);
    // });
    // print('The date $dateStr is a $weekday.');
  }

  @override
  Widget build(BuildContext context) {
    //  print(dates[0]);

    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff060720),
      body: forecastday!.isNotEmpty
          ? Container(
              width: mywidth,
              height: myHeight,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "ForeCast",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(.5)),
                          ),
                          widget.weather.location!.localtime == null
                              ? Text("Loading",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(.5)))
                              : Text(
                                  "${widget.weather.location!.localtime!.substring(0, 10)}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(.5))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
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
                                forecastday![i]?.hour?[firstItemIndex];

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Next ForeCast",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.5))),
                          Icon(Icons.calendar_month_outlined,
                              color: Colors.white.withOpacity(.5))
                        ],
                      ),
                    ),
                    Container(
                      width: mywidth,
                      height: myHeight * .49,
                      child: Container(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            String dateStr = dates![index];
                            DateTime date = DateTime.parse(dateStr);

                            String weekday = DateFormat('EEEE').format(date);
                            // String Datemonth = DateFormat('MMMM').format(date);
                            String Datemonth =
                                DateFormat('d MMMM').format(date);
                            // print('The date $dateStr is a $weekday.');

                            return days!.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 16.0, left: 8.0, right: 8.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "$weekday",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white),
                                                  ),
                                                  Text("$Datemonth",
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  .5))),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text(
                                                  "${days![index]?.avgtempc}C",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, left: 30),
                                              child: days![index]
                                                          ?.condition
                                                          ?.icon ==
                                                      null
                                                  ? Text(
                                                      "loading",
                                                      style: TextStyle(
                                                          fontSize: 4),
                                                    )
                                                  : Image.network(
                                                      "https:${days![index]?.condition?.icon}",
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white.withOpacity(.05)),
                                    ),
                                  )
                                : Text("loading");
                          },
                          itemCount: 7,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                    )
                  ]),
            )
          : Center(
              child: CircularProgressIndicator(
              color: Colors.blue.shade400,
            )),
    );
  }
}
