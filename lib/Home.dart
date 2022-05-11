import 'package:flutter/material.dart';
import 'package:weather_app/Views/TempChart.dart';
import 'package:weather_app/Views/Menu.dart';
import 'views/Atmosphere.dart';
import 'views/Background.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: sliderKey,
        backgroundColor: Colors.grey[900],
        body: Background());
  }
}
