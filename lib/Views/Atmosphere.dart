import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weather_app/Services/WeatherAPI.dart';
import 'package:weather_app/Models/WeatherModel.dart';

String city = "liverpool";


class Atmosphere extends StatefulWidget {
  const Atmosphere({Key? key}) : super(key: key);

  @override
  _AtmosphereState createState() => _AtmosphereState();
}

class _AtmosphereState extends State<Atmosphere> {

  WeatherApiClient client = WeatherApiClient();
  Weather data = Weather();

  void inateState() {
    super.initState();

    client.getCurrentWeather("$city");
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather("$city");
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                SizedBox(
                  height: 380,
                ),
                Column(
                  children: [
                    Text(
                      "Atmosphere",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "F",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GlowContainer(
                          width: 165,
                          borderRadius: BorderRadius.circular(20),
                          glowColor: data.ButtonColor(data.backgroundImage(data.weather)),
                          spreadRadius: 1,
                          blurRadius: 50,
                          color: data.ButtonColor(data.backgroundImage(data.weather)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  "Wind",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "F",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.air,
                                      color: Colors.white,
                                      size: 37,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${data.wind}" + " m/s",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "F",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GlowContainer(
                          width: 135,
                          borderRadius: BorderRadius.circular(20),
                          glowColor: data.ButtonColor(data.backgroundImage(data.weather)),
                          spreadRadius: 1,
                          blurRadius: 50,
                          color: data.ButtonColor(data.backgroundImage(data.weather)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  "Humidity",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "F",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.invert_colors,
                                      color: Colors.white,
                                      size: 37,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${data.humidity}" + " %",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "F",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        GlowContainer(
                          width: 150,
                          borderRadius: BorderRadius.circular(20),
                          glowColor: data.ButtonColor(data.backgroundImage(data.weather)) ,
                          spreadRadius: 1,
                          blurRadius: 50,
                          color: data.ButtonColor(data.backgroundImage(data.weather)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  "Feels like",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "F",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thermostat,
                                      color: Colors.white,
                                      size: 37,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        LimitedBox(
                                          maxWidth: 50,
                                          child: Text(
                                            "${data.toCelsius(data.feelsLike).toString().substring(0,4)}",
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "F",
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          "°C",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "F",
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GlowContainer(
                          width: 170,
                          borderRadius: BorderRadius.circular(20),
                          glowColor: data.ButtonColor(data.backgroundImage(data.weather)),
                          spreadRadius: 1,
                          blurRadius: 50,
                          color: data.ButtonColor(data.backgroundImage(data.weather)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text(
                                  "Pressure",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "F",
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.speed,
                                      color: Colors.white,
                                      size: 37,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${data.pressure}" + " hPa",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: "F",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            );
          }
          return Container();
        });
  }
}
