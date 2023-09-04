import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(
    baseUrl:
        'https://api.weatherapi.com/v1/forecast.json?key=fec8c572404b47bb8c2161007232108&q=london&days=2&aqi=yes&alerts=no')
abstract class PostApiService extends ChopperService {
  @Get(path: '/forecast.json?key=fec8c572404b47bb8c2161007232108')
  Future<Response> getPosts({@Query('q') String country = 'london'});

  @Get(path: '/forecast.json?key=4977308cbf864a1986a75043231207')
  Future<Response> getDaysPosts({
    @Query('q') String country = 'london',
    @Query('days') int days = 3,
  });

  static PostApiService create() {
    return _$PostApiService();
  }
}
