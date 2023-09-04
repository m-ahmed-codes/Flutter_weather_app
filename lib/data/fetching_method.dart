import 'package:chopper/chopper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/api_service.dart';

class FetchApi {
  String user_location = 'myAddress';
  Position? currentPosition;
  int days = 3;

  Map apiData = {};

  Map weather = {};

  final client = ChopperClient(
      baseUrl: Uri(path: 'https://api.weatherapi.com/v1'),
      services: [PostApiService.create()],
      converter: JsonConverter());

  Future getDaysData() async {
    await _determinePosition();

    var chopperService = client.getService<PostApiService>();
    Response response =
        await chopperService.getDaysPosts(country: user_location, days: days);
    return response;
  }

  Future getManyCountryData(String location) async {
    var chopperService = client.getService<PostApiService>();
    Response response = await chopperService.getPosts(country: location);

    return response;
  }

  Future getData() async {
    await _determinePosition();

    var chopperService = client.getService<PostApiService>();
    Response response = await chopperService.getPosts(country: user_location);
    return response;
  }

// this is used to get the current location of the user
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
      currentPosition = position;
      user_location = "${place.locality}";
    } catch (e) {
      print(e);
    }
    return position;
  }
}
