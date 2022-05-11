import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/5DaysWeatherModel.dart';


class TempApiClient_{
  Future <WeekTemp_> getCurrentWeather(String? location) async {
    var endPoint = await Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=$location&mode=json&appid=0266cf392c7c479b1bca1205c445cff9");

    var response = await http.get(endPoint);
    var body = jsonDecode(response.body);
    return (WeekTemp_.fromJson(body));
    }
  }

