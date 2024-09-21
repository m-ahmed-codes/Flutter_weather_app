import 'package:bloc/bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/fetching_method.dart';
import 'package:weather_app/model/Model.dart';

import '../model/ErrorModel.dart';

part 'weatherapi_event.dart';
part 'weatherapi_state.dart';

// Home Screen Bloc
class WeatherapiHomeBloc extends Bloc<WeatherApiHomeEvent, WeatherapiState> {
  WeatherapiHomeBloc() : super(WeatherapiLoadingState()) {
    on<WeatherApiHomeEvent>((event, emit) async {
      try {
        Response response = await FetchApi().getData();
        emit(WeatherapiLoadingState());
        var res = response.body;
        // res['location']['name']
        print('response not t t  tt  ${res['location']['name']}');

       

        if (response.statusCode == 200) {
        print('response bloc ${response}');

          emit(WeatherApiLoadedState(Root.fromJson(response.body)));

        } else {
          print("object");
          emit(WeatherApiErrorState(errorFromJson(response.error.toString())));
        }
      } on Exception catch (e) {
        print(e.toString());
      }
    });
  }
}

// second Search Screen Bloc
class WeatherapiSearchBloc extends Bloc<WeatherapiEvents, WeatherapiState> {
  WeatherapiSearchBloc() : super(WeatherapiSearchLoadingState()) {
    on<WeatherApiSearch_DefaultEvent>((event, emit) async {
      List<Root> allData = [];
      try {
        emit(WeatherapiSearchLoadingState());

        // fetching data of 6 different countries
        Response resParis = await FetchApi().getManyCountryData("Paris");
        Response resLondon = await FetchApi().getManyCountryData("London");
        Response resIslamabad =
            await FetchApi().getManyCountryData("Islamabad");
        Response resTurkey = await FetchApi().getManyCountryData("Turkey");
        Response resIndia = await FetchApi().getManyCountryData("India");
        Response resGermany = await FetchApi().getManyCountryData("Germany");

        allData.add(Root.fromJson(resParis.body));
        allData.add(Root.fromJson(resLondon.body));
        allData.add(Root.fromJson(resIslamabad.body));
        allData.add(Root.fromJson(resTurkey.body));
        allData.add(Root.fromJson(resIndia.body));
        allData.add(Root.fromJson(resGermany.body));

        if (resParis.statusCode == 200 &&
            resParis.statusCode == 200 &&
            resLondon.statusCode == 200 &&
            resIslamabad.statusCode == 200 &&
            resTurkey.statusCode == 200 &&
            resGermany.statusCode == 200 &&
            resIndia.statusCode == 200) {
          emit(WeatherApiSearch_DefaultLoadedState(allData));
        } else {
          emit(WeatherApiSearchErrorState("Something went wrong"));
        }
      } catch (e) {}
    });

    // Search Button On Method Event this is used when Search button is clicked
    on<WeatherApiSearch_ButtonEvent>((event, emit) async {
      try {
        emit(WeatherapiSearchButtonLoadingState());

        Response response = await FetchApi().getManyCountryData(event.loc);

        print("Rerponse from bloc for search button ${response.body}");
        if (response.statusCode == 200) {
          print("response body ${response.body}");

          emit(
              WeatherApiSearch_ButtonLoadedState(Root.fromJson(response.body)));
        } else {
          emit(WeatherApiSearchButtonErrorState(
              errorFromJson(response.error.toString())));
        }
      } catch (e) {
        print(e);
      }
    });
  }
}

// Forecast  Screen Bloc
class WeatherapiForecastBloc
    extends Bloc<WeatherApiForecastEvent, WeatherapiState> {
  WeatherapiForecastBloc() : super(WeatherapiForecastLoadingState()) {
    on<WeatherApiForecastEvent>((event, emit) async {
      try {
        emit(WeatherapiForecastLoadingState());
        Response response = await FetchApi().getDaysData();

        List<Forecastday?>? forecastday = [];
        List<Day?>? days = [];
        List? dates = [];

        if (response.statusCode == 200) {
          Root data = Root.fromJson(response.body);

          //  this is for Forecast data
          if (data.forecast!.forecastday != null) {
            for (var i = 0; i < data.forecast!.forecastday!.length; i++) {
              if (data.forecast!.forecastday != null) {
                forecastday.add(data.forecast!.forecastday![i]);
                days.add(data.forecast!.forecastday![i]!.day);
                dates.add(data.forecast!.forecastday![i]!.date);
              }
            }
          }

          emit(WeatherapiForecastLoadedState(forecastday, days, dates, data));
        } else {
          emit(WeatherapiForecastErrorState(
              errorFromJson(response.error.toString())));
        }
      } on Exception catch (e) {
        print(e);
      }
    });
  }
}
