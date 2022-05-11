import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/Models/CityModel.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _SideMenuState();
}

class _SideMenuState extends State<Location> {

  City city = City();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.grey[700]!,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 37,
                                ),
                                Text(
                                  "  Change locations  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "F",
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      city.tile("EG", "Alexandria","Alexandria", context),
                      city.tile("KR", "Seoul","Seoul", context),
                      city.tile("IN", "Mumbai","mumbai", context),
                      city.tile("EG", "Cairo","Cairo", context),
                      city.tile("RU", "Moscow","Moscow", context),
                      city.tile("FR", "Paris","Paris", context),
                      city.tile("GB", "LiverPool", "LiverPool", context),
                      city.tile("US", "Las Vegas","lasvegas", context),
                      city.tile("US", "Los Angeles","losangeles", context),
                      city.tile("DE", "Berlin","berlin", context),
                      city.tile("JP", "Hong Kong","hongkong", context),

                    ],
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
