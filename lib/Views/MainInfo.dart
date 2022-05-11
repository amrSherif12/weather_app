import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'Atmosphere.dart';
import 'Location.dart';
import 'package:weather_app/Services/WeatherAPI.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'Menu.dart';

class MainInfo extends StatefulWidget {
  const MainInfo({Key? key}) : super(key: key);

  @override
  _MainInfoState createState() => _MainInfoState();
}

class _MainInfoState extends State<MainInfo> {
  bool cel = false;

  WeatherApiClient client = WeatherApiClient();
  Weather data = Weather();

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather("$city");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "${data.cityName}",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontFamily: "F",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                              Text(
                                "${data.country}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "F",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          height: 150,
                        ),
                        Image.asset("${data.icon(data.weather)}")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${data.weather}",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: "F",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),

                  ],
                );
              } else {
                return Container();
              }
            }),
      ],
    );
  }
}
