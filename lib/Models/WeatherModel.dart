
import 'dart:ui';

class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  String? weather;
  double? minTemp;
  double? maxTemp;
  String? country;
  int? timeZone;
  bool? cel = true;

  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
    this.weather,
    this.maxTemp,
    this.minTemp,
    this.country,
    this.timeZone,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    feelsLike = json["main"]["feels_like"];
    weather = json["weather"][0]["description"];
    maxTemp = json["main"]["temp_max"];
    minTemp = json["main"]["temp_min"];
    country = json["sys"]["country"];
    timeZone = json["timezone"];
  }

  double toCelsius(double? temp) {
    double celsius = temp != null ? temp - 273 : 0;
    return celsius;
  }

  double toFahrenheit(double? temp){
    double fahrenheit = temp! * (9/5) - 459.67;
    return fahrenheit;
  }

  String? icon(String? weather) {
    String? icon;

    if (weather == "clear sky") {
      icon = "assets/icons/icon (3).png";
      return icon;
    } else if (weather == "few clouds") {
      icon = "assets/icons/icon (4).png";
      return icon;
    } else if (weather == "scattered clouds") {
      icon = "assets/icons/icon (5).png";
      return icon;
    } else if (weather == "broken clouds") {
      icon = "assets/icons/icon (7).png";
      return icon;
    } else if (weather == "shower rain") {
      icon = "assets/icons/icon (2).png";
      return icon;
    }else if (weather == "heavy intensity rain") {
      icon = "assets/icons/icon (2).png";
      return icon;
    } else if (weather == "rain") {
      icon = "assets/icons/icon (1).png";
      return icon;
    } else if (weather == "light rain") {
      icon = "assets/icons/icon (1).png";
      return icon;
    }else if (weather == "moderate rain") {
      icon = "assets/icons/icon (1).png";
      return icon;
    } else if (weather == "thunderstorm") {
      icon = "assets/icons/icon (8).png";
      return icon;
    } else if (weather == "snow") {
      icon = "assets/icons/icon (9).png";
      return icon;
    } else if (weather == "mist") {
      icon = "assets/icons/icon (6).png";
      return icon;
    } else if (weather == "haze") {
      icon = "assets/icons/icon (6).png";
      return icon;
    } else if (weather == "overcast clouds") {
      icon = "assets/icons/icon (5).png";
      return icon;
    }
    return "assets/icons/icon (4).png";
  }

  String backgroundImage(String? weather) {
    String image;
    if (weather == "rain") {
      image = "assets/1.svg";
      return image;
    } else if (weather == "shower rain") {
      image = "assets/1.svg";
      return image;
    }else if (weather == "light rain") {
      image = "assets/1.svg";
      return image;
    }else if (weather == "moderate rain") {
      image = "assets/1.svg";
      return image;
    }else if (weather == "heavy intensity rain") {
      image = "assets/1.svg";
      return image;
    } else if (weather == "clear sky") {
      image = "assets/2.svg";
      return image;
    } else if (weather == "mist") {
      image = "assets/3.svg";
      return image;
    }  else if (weather == "haze") {
      image = "assets/3.svg";
      return image;
    } else if (weather == "broken clouds") {
      image = "assets/4.svg";
      return image;
    } else if (weather == "scattered clouds") {
      image = "assets/6.svg";
      return image;
    } else if (weather == "snow") {
      image = "assets/5.svg";
      return image;
    } else if (weather == "few clouds") {
      image = "assets/6.svg";
      return image;
    } else if (weather == "thunderstorm") {
      image = "assets/4.svg";
      return image;
    } else if (weather == "overcast clouds") {
      image = "assets/5.svg";
      return image;
    }
    return "assets/4.svg";
  }

  Color? ButtonColor(String? image) {
    if (image == "assets/1.svg") {
      return Color(0xFF336698);
    } else if (image == "assets/2.svg") {
      return Color(0xFFBB7B5F);
    } else if (image == "assets/3.svg") {
      return Color(0xFF8B5A77);
    } else if (image == "assets/4.svg") {
      return Color(0xFF5F8C70);
    } else if (image == "assets/5.svg") {
      return Color(0xFF5A6572);
    } else if (image == "assets/6.svg") {
      return Color(0xFF36B7C4);
    }
  }
}