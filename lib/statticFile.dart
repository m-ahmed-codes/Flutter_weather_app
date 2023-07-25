class Weather {
  // Map Location_data;
  static String location = "";

  Map _locations = {};

  Map get locations => _locations;

  set locations(Map value) {
    _locations = value;
  }

  Map _current = {};

  Map get current => _current;

  set current(Map value) {
    _current = value;
  }

  Map _forecast = {};

  Map get forecast => _forecast;

  set forecast(Map value) {
    _forecast = value;
  }

  // Weather({required this.Location_data});
}
