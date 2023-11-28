import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '9d78fb2ccaed496598b153116232210';
  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String erorMessage = e.response?.data['error']['message'] ??
          ' opps there was an error , try later!';
      throw Exception(erorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(' opps there was an error , try later!');
    }
  }
}
