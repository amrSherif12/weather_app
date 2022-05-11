import 'package:flutter/material.dart';
import 'package:weather_app/Services/WeatherAPI.dart';
import 'package:weather_app/Views/Atmosphere.dart';
import 'WeatherModel.dart';
import 'package:circle_flags/circle_flags.dart';

class City {
  WeatherApiClient client = WeatherApiClient();
  Weather data = Weather();

  void inateState() {
    client.getCurrentWeather("$city");
  }

  var country;
  Future<void> getData() async {
    data = await client.getCurrentWeather("$city");
    country = data.country;
  }

  Widget tile(
      String flag, String? cityName, String? cityName_, BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, cityName);
              },
              child: Container(
                color: Colors.grey[900],
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        LimitedBox(
                          child: CircleFlag("$flag"),
                          maxWidth: 50,
                          maxHeight: 50,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "$cityName",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: "F",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Divider(
                      height: 40,
                      thickness: 2,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
