import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(
    baseUrl:
        'https://api.weatherapi.com/v1/forecast.json?key=0fd88b9df21f4a5a9b7161254242009&q=london&days=2&aqi=yes&alerts=no')
abstract class PostApiService extends ChopperService {
  @Get(path: '/forecast.json?key=0fd88b9df21f4a5a9b7161254242009')
  Future<Response> getPosts({@Query('q') String country = 'london'});

  @Get(path: '/forecast.json?key=0fd88b9df21f4a5a9b7161254242009')
  Future<Response> getDaysPosts({
    @Query('q') String country = 'london',
    @Query('days') int days = 3,
  });

  static PostApiService create() {
    return _$PostApiService();
  }
}
