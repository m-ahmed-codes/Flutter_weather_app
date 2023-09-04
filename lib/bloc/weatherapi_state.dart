part of 'weatherapi_bloc.dart';

abstract class WeatherapiState extends Equatable {
  const WeatherapiState();
  @override
  List<Object> get props => [];
}

// Home page State Start here
class WeatherapiInitial extends WeatherapiState {}

class WeatherapiLoadingState extends WeatherapiState {}

class WeatherApiLoadedState extends WeatherapiState {
  Root root = Root();
  WeatherApiLoadedState(this.root);

  List<Object> get props => [root];
}

class WeatherApiErrorState extends WeatherapiState {
  Error error;
  WeatherApiErrorState(this.error);
  List<Object> get props => [];
}
// Home page State end here

// Search page State Start here
class WeatherapiSearchLoadingState extends WeatherapiState {}

class WeatherapiSearchButtonLoadingState extends WeatherapiState {}

class WeatherApiSearch_DefaultLoadedState extends WeatherapiState {
  List<Root> root;
  WeatherApiSearch_DefaultLoadedState(this.root);

  List<Object> get props => [root];
}

class WeatherApiSearch_ButtonLoadedState extends WeatherapiState {
  Root roots = Root();
  WeatherApiSearch_ButtonLoadedState(this.roots);

  List<Object> get props => [roots];
}

class WeatherApiSearchButtonErrorState extends WeatherapiState {
  // error

  Error error;
  // String err;
  WeatherApiSearchButtonErrorState(this.error);
  List<Object> get props => [];
}

class WeatherApiSearchErrorState extends WeatherapiState {
  String error;
  WeatherApiSearchErrorState(this.error);

  List<Object> get props => [];
}

// Search page State End here

// Forecast page State Start here
class WeatherapiForecastLoadingState extends WeatherapiState {}

class WeatherapiForecastLoadedState extends WeatherapiState {
  List<Forecastday?>? forecastday = [];
  List<Day?>? days = [];
  List? dates = [];
  Root data;
  WeatherapiForecastLoadedState(
      this.forecastday, this.days, this.dates, this.data);

  List<Object> get props => [];
}

class WeatherapiForecastErrorState extends WeatherapiState {
  Error error;
  WeatherapiForecastErrorState(this.error);

  List<Object> get props => [];
}



















// class ProductsLoadedState extends ProductsState {
//   final List<Product> post;

//   ProductsLoadedState(this.post);

//   List<Object> get props => [post];
// }

// class ProductsErrorState extends ProductsState {
//   final String errorMsg;

//   ProductsErrorState(this.errorMsg);
//   List<Object> get props => [errorMsg];
// }
