import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

int value = 1;
int unit = 0;

class _MenuState extends State<Menu> {
  TextStyle style = TextStyle(
      fontSize: 20,
      fontFamily: "F",
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.grey[900],
      title: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SvgPicture.asset(
              "assets/7.svg",
              alignment: Alignment.topRight,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text("Dark Sky",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "F",
                      ))),
            ],
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.grey[700]!,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size: 37,
                                  ),
                                  Text(
                                    "        About        ",
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
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("- App name: Dark Sky", style: style),
                          Text("- Version: 1.0", style: style),
                          Text("- Developer: Amr Sherif", style: style),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
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
