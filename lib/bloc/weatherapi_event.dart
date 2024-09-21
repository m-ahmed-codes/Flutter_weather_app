part of 'weatherapi_bloc.dart';

abstract class WeatherapiEvents extends Equatable {
  WeatherapiEvent();
  @override
  List<Object> get props => [];
}

// this is the Event that Home Screen give to The bloc
class WeatherApiHomeEvent extends Equatable {
  WeatherApiHomeEvent();
  @override
  List<Object> get props => [];
}

// this is the Event that Search Screen give to The bloc
class WeatherApiSearch_DefaultEvent extends WeatherapiEvents {
  WeatherApiSearch_DefaultEvent();
  @override
  List<Object> get props => [];

  @override
  WeatherapiEvent() {
    // TODO: implement WeatherapiEvent
    throw UnimplementedError();
  }
}

// this is the Event that Search Screen when user click on SearchButton give to The bloc
class WeatherApiSearch_ButtonEvent extends WeatherapiEvents {
  String loc;
  WeatherApiSearch_ButtonEvent(this.loc);
  @override
  List<Object> get props => [];

  @override
  WeatherapiEvent() {
    // TODO: implement WeatherapiEvent
    throw UnimplementedError();
  }
}

// this is the Event that Forecast Screen give to The bloc
class WeatherApiForecastEvent extends WeatherapiEvents {
  WeatherApiForecastEvent();
  @override
  List<Object> get props => [];

  @override
  WeatherapiEvent() {
    // TODO: implement WeatherapiEvent
    throw UnimplementedError();
  }
}
