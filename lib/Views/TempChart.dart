import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/Models/5DaysWeatherModel.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Services/5DayWeatherAPI.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Services/WeatherAPI.dart';
import 'Atmosphere.dart';

late List<WeekTemp> _chartData;

class Atmosphere2 extends StatefulWidget {
  const Atmosphere2({Key? key}) : super(key: key);

  @override
  _AtmosphereState createState() => _AtmosphereState();
}

class _AtmosphereState extends State<Atmosphere2> {
  TempApiClient_ tempClient = TempApiClient_();
  WeekTemp_ tempData = WeekTemp_();

  WeatherApiClient Client = WeatherApiClient();
  Weather data = Weather();

  late TooltipBehavior toolTip;

  void initState() {
    super.initState();
    tempClient.getCurrentWeather("$city");
    Client.getCurrentWeather("$city");
  }

  Future<void> getData() async {
    tempData = await tempClient.getCurrentWeather("$city");
    _chartData = getChartData();
    toolTip = TooltipBehavior(enable: true);
  }

  Future<void> getData_() async {
    data = await Client.getCurrentWeather("$city");
  }

  List<WeekTemp> getChartData() {
    final List<WeekTemp> chartData = [
      WeekTemp(temp: tempData.toCelsius(tempData.temp1), time: 1),
      WeekTemp(temp: tempData.toCelsius(tempData.temp2), time: 2),
      WeekTemp(temp: tempData.toCelsius(tempData.temp3), time: 3),
      WeekTemp(temp: tempData.toCelsius(tempData.temp4), time: 4),
      WeekTemp(temp: tempData.toCelsius(tempData.temp5), time: 5),
      WeekTemp(temp: tempData.toCelsius(tempData.temp6), time: 6),
      WeekTemp(temp: tempData.toCelsius(tempData.temp7), time: 7),
      WeekTemp(temp: tempData.toCelsius(tempData.temp8), time: 8),
      WeekTemp(temp: tempData.toCelsius(tempData.temp9), time: 9),
      WeekTemp(temp: tempData.toCelsius(tempData.temp10), time: 10),
      WeekTemp(temp: tempData.toCelsius(tempData.temp11), time: 11),
      WeekTemp(temp: tempData.toCelsius(tempData.temp12), time: 12),
      WeekTemp(temp: tempData.toCelsius(tempData.temp13), time: 13),
      WeekTemp(temp: tempData.toCelsius(tempData.temp14), time: 14),
      WeekTemp(temp: tempData.toCelsius(tempData.temp15), time: 15),
      WeekTemp(temp: tempData.toCelsius(tempData.temp16), time: 16),
      WeekTemp(temp: tempData.toCelsius(tempData.temp17), time: 17),
      WeekTemp(temp: tempData.toCelsius(tempData.temp18), time: 18),
      WeekTemp(temp: tempData.toCelsius(tempData.temp19), time: 19),
      WeekTemp(temp: tempData.toCelsius(tempData.temp20), time: 20),
      WeekTemp(temp: tempData.toCelsius(tempData.temp21), time: 21),
      WeekTemp(temp: tempData.toCelsius(tempData.temp22), time: 22),
      WeekTemp(temp: tempData.toCelsius(tempData.temp23), time: 23),
      WeekTemp(temp: tempData.toCelsius(tempData.temp24), time: 24),
      WeekTemp(temp: tempData.toCelsius(tempData.temp25), time: 25),
      WeekTemp(temp: tempData.toCelsius(tempData.temp26), time: 26),
      WeekTemp(temp: tempData.toCelsius(tempData.temp27), time: 27),
      WeekTemp(temp: tempData.toCelsius(tempData.temp28), time: 28),
      WeekTemp(temp: tempData.toCelsius(tempData.temp29), time: 29),
      WeekTemp(temp: tempData.toCelsius(tempData.temp30), time: 30),
      WeekTemp(temp: tempData.toCelsius(tempData.temp31), time: 31),
      WeekTemp(temp: tempData.toCelsius(tempData.temp32), time: 32),
      WeekTemp(temp: tempData.toCelsius(tempData.temp33), time: 33),
      WeekTemp(temp: tempData.toCelsius(tempData.temp34), time: 34),
      WeekTemp(temp: tempData.toCelsius(tempData.temp35), time: 35),
      WeekTemp(temp: tempData.toCelsius(tempData.temp36), time: 36),
      WeekTemp(temp: tempData.toCelsius(tempData.temp37), time: 37),
      WeekTemp(temp: tempData.toCelsius(tempData.temp38), time: 38),
      WeekTemp(temp: tempData.toCelsius(tempData.temp39), time: 39),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData_(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      Spacer(),
                      SizedBox(
                        height: 350,
                      ),
                      SfCartesianChart(
                        plotAreaBorderWidth: 1,
                        tooltipBehavior: toolTip,
                        series: <ChartSeries>[
                          AreaSeries<WeekTemp, double>(
                            name: "Temperature",
                            borderWidth: 3,
                            borderColor: data.ButtonColor(
                                data.backgroundImage(data.weather)),
                            opacity: 0.2,
                            color: data.ButtonColor(
                                data.backgroundImage(data.weather)),
                            animationDuration: 4000,
                            dataSource: _chartData,
                            xValueMapper: (WeekTemp Temp, _) => Temp.time,
                            yValueMapper: (WeekTemp Temp, _) => Temp.temp,
                          ),
                        ],
                        primaryXAxis: NumericAxis(
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          majorGridLines: MajorGridLines(width: 0),
                          axisLine: AxisLine(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                          labelFormat: "{value}°C",
                          majorGridLines: MajorGridLines(width: 0),
                          axisLine: AxisLine(width: 0),
                        ),
                      ),
                    ],
                  );
                }

                return Container();
              });
        }
        return Container();
      },
    );
  }
}
