// import 'dart:js_interop';

import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather_app/Screen/Splash.dart';
import 'package:weather_app/model/Model.dart';
import 'package:weather_app/model/ErrorModel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

FetchApi CountriesData = FetchApi();

class _SearchPageState extends State<SearchPage> {
  List<Root> allData = [];

  @override
  void initState() {
    super.initState();
    CallData();
  }

  Root? parisData;
  Root? londonData;
  Root? islamabadData;
  Root? TurkeyData;
  Root? IndiaData;
  Root? germanyData;

  Root SearchData = Root();
  // Response response;
  bool error = false;

  Future<void> Searching(String loc) async {
    Response response = await CountriesData.getSearchCountryData(loc);

    if (response.statusCode == 200) {
      SearchData = Root.fromJson(response.body);

      error = false;
      // return error;
    } else {
      error = true;
      // return error;
    }
  }

  Future<void> CallData() async {
    parisData = await CountriesData.getManyCountryData("Paris");
    londonData = await CountriesData.getManyCountryData("London");
    islamabadData = await CountriesData.getManyCountryData("Islamabad");
    TurkeyData = await CountriesData.getManyCountryData("Turkey");
    IndiaData = await CountriesData.getManyCountryData("India");
    germanyData = await CountriesData.getManyCountryData("Germany");
    setState(() {
      allData.add(parisData!);
      allData.add(londonData!);
      allData.add(islamabadData!);
      allData.add(TurkeyData!);
      allData.add(IndiaData!);
      allData.add(germanyData!);

      // print(allData[0].current?.tempc);
    });
  }

  var SearchController = TextEditingController();
  IconData Changeicon = Icons.search;
  bool flag = true;

  bool display = true;
  bool waiting = true;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    // print("null ${SearchData.toString()}");
    // print("name ${SearchData?.location?.name}");
    // print("name1 ${response?.body.toString()}");
    // print("name ${response?.error["error"]}");

    return Scaffold(
      backgroundColor: Color(0xff060720),
      body: allData.isNotEmpty
          ? Container(
              width: mywidth,
              height: myHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 72,
                  ),
                  Text("Pick Location"),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Find the area or city that you want to know the detailed weather info at this Time",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.05),
                                borderRadius: BorderRadius.circular(30)),
                            width: mywidth * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              child: TextField(
                                controller: SearchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.5)),
                                    prefixIcon:
                                        Icon(Icons.location_on_outlined),
                                    prefixIconColor:
                                        Colors.white.withOpacity(.5),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity(.3))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20))),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.05),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    if (flag == true) {
                                      flag = false;

                                      Searching(
                                              SearchController.text.toString())
                                          .whenComplete(() {
                                        setState(() {
                                          waiting = false;
                                        });
                                      });

                                      display = false;
                                      setState(() {
                                        Changeicon = Icons.close;
                                      });
                                    } else {
                                      flag = true;
                                      display = true;

                                      setState(() {
                                        Changeicon = Icons.search;
                                        waiting = true;
                                      });
                                    }
                                  },
                                  icon: Icon(Changeicon)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  display
                      ? Expanded(
                          child: GridView.custom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mywidth * 0.02),
                              gridDelegate: SliverStairedGridDelegate(
                                  pattern: [
                                    StairedGridTile(0.5, 3 / 2.2),
                                    StairedGridTile(0.5, 3 / 2.2)
                                  ],
                                  mainAxisSpacing: 12,
                                  startCrossAxisDirectionReversed: false),
                              childrenDelegate: SliverChildBuilderDelegate(
                                  childCount: 6, (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mywidth * 0.02),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.09),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              allData.isEmpty
                                                  ? Text(
                                                      "Loading",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )
                                                  : Text(
                                                      "${allData[index].current?.tempc}",
                                                      style: TextStyle(
                                                          fontSize: 24),
                                                    ),
                                              allData.isEmpty
                                                  ? Text(
                                                      "Loading",
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    )
                                                  : Image.network(
                                                      "http:${allData[index].current?.condition?.icon}")
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: allData.isEmpty
                                                ? Text("loading",
                                                    style:
                                                        TextStyle(fontSize: 10))
                                                : Text(
                                                    "${allData[index].location?.name}",
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                          )
                                        ]),
                                  ),
                                );
                              })))
                      : error
                          ? waiting
                              ? Text("Loading")
                              : Text("Result not found")
                          : !waiting
                              ? Expanded(
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "${SearchData.location?.name}, ${SearchData.location?.country} ",
                                      style: TextStyle(fontSize: 36),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "${SearchData.current?.lastupdated} ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Image.network(
                                      "https:${SearchData.current?.condition?.icon}",
                                      scale: .1,
                                      width: 200,
                                    ),
                                    Text(
                                      "${SearchData.current?.condition?.text}",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "${SearchData.current?.tempc}C",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ))
                              : Text("Loading")
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}


// : 



