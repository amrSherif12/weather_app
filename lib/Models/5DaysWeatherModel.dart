class WeekTemp {
  double? temp;
  double? time;


  WeekTemp({
    this.temp,
    this.time,
  });
}

class WeekTemp_ {
  double? temp1;
  double? temp2;
  double? temp3;
  double? temp4;
  double? temp5;
  double? temp6;
  double? temp7;
  double? temp8;
  double? temp9;
  double? temp10;
  double? temp11;
  double? temp12;
  double? temp13;
  double? temp14;
  double? temp15;
  double? temp16;
  double? temp17;
  double? temp18;
  double? temp19;
  double? temp20;
  double? temp21;
  double? temp22;
  double? temp23;
  double? temp24;
  double? temp25;
  double? temp26;
  double? temp27;
  double? temp28;
  double? temp29;
  double? temp30;
  double? temp31;
  double? temp32;
  double? temp33;
  double? temp34;
  double? temp35;
  double? temp36;
  double? temp37;
  double? temp38;
  double? temp39;
  double? temp40;
  double? time;


  WeekTemp_({
    this.temp1,
    this.temp2,
    this.temp3,
    this.temp4,
    this.temp5,
    this.temp6,
    this.temp7,
    this.temp8,
    this.temp9,
    this.temp10,
    this.temp11,
    this.temp12,
    this.temp13,
    this.temp14,
    this.temp15,
    this.temp16,
    this.temp17,
    this.temp18,
    this.temp19,
    this.temp20,
    this.temp21,
    this.temp22,
    this.temp23,
    this.temp24,
    this.temp25,
    this.temp26,
    this.temp27,
    this.temp28,
    this.temp29,
    this.temp30,
    this.temp31,
    this.temp32,
    this.temp33,
    this.temp34,
    this.temp35,
    this.temp36,
    this.temp37,
    this.temp38,
    this.temp39,
    this.temp40,
    this.time,
  });
  WeekTemp_.fromJson(Map<String, dynamic> json) {
    temp1 = json["list"][0]["main"]["temp"];
    temp2 = json["list"][1]["main"]["temp"];
    temp3 = json["list"][2]["main"]["temp"];
    temp4 = json["list"][3]["main"]["temp"];
    temp5 = json["list"][4]["main"]["temp"];
    temp6 = json["list"][5]["main"]["temp"];
    temp7 = json["list"][6]["main"]["temp"];
    temp8 = json["list"][7]["main"]["temp"];
    temp9 = json["list"][8]["main"]["temp"];
    temp10 = json["list"][9]["main"]["temp"];
    temp11 = json["list"][10]["main"]["temp"];
    temp12 = json["list"][11]["main"]["temp"];
    temp13 = json["list"][12]["main"]["temp"];
    temp14 = json["list"][13]["main"]["temp"];
    temp15 = json["list"][14]["main"]["temp"];
    temp16 = json["list"][15]["main"]["temp"];
    temp17 = json["list"][16]["main"]["temp"];
    temp18 = json["list"][17]["main"]["temp"];
    temp19 = json["list"][18]["main"]["temp"];
    temp20 = json["list"][19]["main"]["temp"];
    temp21 = json["list"][20]["main"]["temp"];
    temp22 = json["list"][21]["main"]["temp"];
    temp23 = json["list"][22]["main"]["temp"];
    temp24 = json["list"][23]["main"]["temp"];
    temp25 = json["list"][24]["main"]["temp"];
    temp26 = json["list"][25]["main"]["temp"];
    temp27 = json["list"][26]["main"]["temp"];
    temp28 = json["list"][27]["main"]["temp"];
    temp29 = json["list"][28]["main"]["temp"];
    temp30 = json["list"][29]["main"]["temp"];
    temp31 = json["list"][30]["main"]["temp"];
    temp32 = json["list"][31]["main"]["temp"];
    temp33 = json["list"][32]["main"]["temp"];
    temp34 = json["list"][33]["main"]["temp"];
    temp35 = json["list"][34]["main"]["temp"];
    temp36 = json["list"][35]["main"]["temp"];
    temp37 = json["list"][36]["main"]["temp"];
    temp38 = json["list"][37]["main"]["temp"];
    temp39 = json["list"][38]["main"]["temp"];
    temp40 = json["list"][39]["main"]["temp"];
  }

  double toCelsius(double? temp) {
    double celsius = temp != null ? temp - 273 : 0;
    return celsius;
  }

}

