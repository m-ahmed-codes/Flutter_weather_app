import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weather_app/bloc/weatherapi_bloc.dart';
import 'package:weather_app/model/Model.dart';

import '../data/fetching_method.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

FetchApi CountriesData = FetchApi();

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<WeatherapiSearchBloc>().add(WeatherApiSearch_DefaultEvent());
    super.initState();
  }

  Root SearchData = Root();
  bool error = false;

  var SearchController = TextEditingController();
  IconData Changeicon = Icons.search;
  bool flag = true;

  bool display = true;
  bool waiting = true;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double mywidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xff060720),
        body: Container(
          width: mywidth,
          height: myHeight,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                              prefixIcon: Icon(Icons.location_on_outlined),
                              prefixIconColor: Colors.white.withOpacity(.5),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.white.withOpacity(.3))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20))),
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
                                if (SearchController.text.toString() == "") {
                                } else {
                                  flag = false;

                                  waiting = false;

                                  context.read<WeatherapiSearchBloc>().add(
                                      WeatherApiSearch_ButtonEvent(
                                          SearchController.text.toString()));

                                  display = false;
                                  setState(() {
                                    Changeicon = Icons.close;
                                  });
                                }
                              } else {
                                flag = true;
                                display = true;
                                context
                                    .read<WeatherapiSearchBloc>()
                                    .add(WeatherApiSearch_DefaultEvent());

                                setState(() {
                                  SearchController.text = "";
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
                ? BlocBuilder<WeatherapiSearchBloc, WeatherapiState>(
                    builder: (context, state) {
                      if (state is WeatherapiSearchLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WeatherApiSearch_DefaultLoadedState) {
                        return Expanded(
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
                                                Text(
                                                  "${state.root[index].current?.tempc}",
                                                  style:
                                                      TextStyle(fontSize: 24),
                                                ),
                                                Image.network(
                                                    "http:${state.root[index].current?.condition?.icon}")
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                  "${state.root[index].location?.name}",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                            )
                                          ]),
                                    ),
                                  );
                                })));
                      }

                      return Text("dadada");
                    },
                  )
                :
                // SearchData.location?.name
                BlocBuilder<WeatherapiSearchBloc, WeatherapiState>(
                    builder: (context, state) {
                      if (state is WeatherapiSearchButtonLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WeatherApiSearch_ButtonLoadedState) {
                        return Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "${state.roots.location?.name}, ${state.roots.location?.country} ",
                              style: TextStyle(fontSize: 36),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "${state.roots.current?.lastupdated} ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Image.network(
                              "https:${state.roots.current?.condition?.icon}",
                              scale: .1,
                              width: 200,
                            ),
                            Text(
                              "${state.roots.current?.condition?.text}",
                              style: TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "${state.roots.current?.tempc}C",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ));
                      } else if (state is WeatherApiSearchButtonErrorState) {
                        return SizedBox(
                            height: 60,
                            child: Center(
                                child: Text(
                                    state.error.error!.message.toString())));
                      }
                      return Text("data");
                    },
                  )
          ]),
        ));
  }
}
