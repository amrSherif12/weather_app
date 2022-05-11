import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Services/WeatherAPI.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Views/Location.dart';
import 'Atmosphere.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'TempChart.dart';
import 'MainInfo.dart';
import 'Menu.dart';

GlobalKey<ScaffoldState> sliderKey = GlobalKey<ScaffoldState>();
bool cel = true;


class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

final slider = [Atmosphere(), Atmosphere2()];

class _BackgroundState extends State<Background> {
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
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(data.backgroundImage(data.weather),
                        alignment: Alignment.topRight,
                        height: 360,
                        width: double.infinity,
                        fit: BoxFit.cover),
                  ],
                ),
                WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.grey[900]!, Colors.grey[900]!],
                      [Colors.grey[900]!, Colors.grey[900]!],
                    ],
                    durations: [20000, 20000],
                    heightPercentages: [0.38, 0.38],
                  ),
                  size: Size(double.infinity, double.infinity),
                ),
                MainInfo(),
                CarouselSlider(
                  items: slider,
                  options: CarouselOptions(
                    initialPage: 0,
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Menu());
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 30,
                            )),
                        Spacer(),
                        IconButton(
                            onPressed: () async {
                              city = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Location()));
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.location_on_outlined,
                              size: 30,
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 240,),
                        Column(
                          children: [
                            SizedBox(height: 100,),
                           GestureDetector(
                              onTap: (){
                                cel = !cel;
                                print(cel);
                                setState(() {
                                });
                              },
                             child: Text(cel? " °F" : " °C",style: TextStyle(
                                 fontSize: 23,
                                 fontFamily: "F",
                                 fontWeight: FontWeight.bold,
                                 letterSpacing: 1,
                                 color: Colors.grey[700]),),
                           )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: 100, width: 100,),

                            Text(
                              cel
                                  ? "${data.toCelsius(data.temp).toString().substring(0, 4)}"
                                  : "${data.toFahrenheit(data.temp).toString().substring(0, 4)}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 50,
                                  fontFamily: "F",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.white),
                            ),
                            Text(
                              cel ? " °C" : " °F",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 50,
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
              ],
            );
          }
          return Container();
        });
  }
}
