import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/WeatherModel.dart';

class WeatherApiClient{
  Future <Weather> getCurrentWeather(String? location) async {
    var endPoint = await Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&mode=json&appid=0266cf392c7c479b1bca1205c445cff9");

    var response = await http.get(endPoint);
    var body = jsonDecode(response.body);
    return (Weather.fromJson(body));
  }
}