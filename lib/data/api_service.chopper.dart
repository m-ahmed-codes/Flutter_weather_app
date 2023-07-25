// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PostApiService extends PostApiService {
  _$PostApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PostApiService;

  @override
  Future<Response<dynamic>> getPosts({String country = 'london'}) {
    final Uri $url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=4977308cbf864a1986a75043231207&q=london&days=2&aqi=yes&alerts=no/forecast.json?key=4977308cbf864a1986a75043231207');
    final Map<String, dynamic> $params = <String, dynamic>{'q': country};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getDaysPosts({
    String country = 'london',
    int days = 7,
  }) {
    final Uri $url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=4977308cbf864a1986a75043231207&q=london&days=2&aqi=yes&alerts=no/forecast.json?key=4977308cbf864a1986a75043231207');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': country,
      'days': days,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
