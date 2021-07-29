import 'package:bmi_calculator/myProvider.dart';
import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(int.parse("0xff${hexString}")),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("0xff${hexString}")).withOpacity(.85),
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              maleOrfemaleContainer("MALE", Icons.male),
              maleOrfemaleContainer("FEMALE", Icons.female),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 170,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(int.parse("0xff${hexStr}")).withOpacity(1)),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(color: Colors.white.withOpacity(.5)),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${Provider.of<MyProvider>(context, listen: false).height.round()}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "cm",
                        style: TextStyle(color: Colors.white.withOpacity(.5)),
                      ),
                    ],
                  ),
                ),
                Slider(
                  activeColor: Color(int.parse("0xff${hexSlider}")),
                  inactiveColor: Colors.white,
                  max: 200,
                  min: 0,
                  value: Provider.of<MyProvider>(context, listen: false).height,
                  onChanged: (val) {
                    Provider.of<MyProvider>(context, listen: false)
                        .changeWidthSlider(val);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(int.parse("0xff${hexStr}")).withOpacity(1)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("WEGHT",
                          style:
                              TextStyle(color: Colors.white.withOpacity(.5))),
                      Text(
                          "${Provider.of<MyProvider>(context, listen: false).weight}",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildElevatedButton1(
                              Icons.minimize,
                              Provider.of<MyProvider>(context, listen: false)
                                  .decreaseweght),
                          buildElevatedButton2(
                            Icons.add,
                            Provider.of<MyProvider>(context, listen: false)
                                .increaseweght,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(int.parse("0xff${hexStr}")).withOpacity(1)),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text("AGE",
                          style:
                              TextStyle(color: Colors.white.withOpacity(.5))),
                      Text(
                          "${Provider.of<MyProvider>(context, listen: true).age}",
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildElevatedButton1(
                              Icons.minimize,
                              Provider.of<MyProvider>(context, listen: false)
                                  .decreaseage),
                          buildElevatedButton2(
                              Icons.add,
                              Provider.of<MyProvider>(context, listen: false)
                                  .increaseage),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false).calculateBMI();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
              color: Color(int.parse("0xff${raisedButton}")).withOpacity(1),
              child: Text(
                "CALCULATE",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton1(IconData icon, Function function) {
    return ElevatedButton(
      onPressed: () => function(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.only(bottom: 20),
        primary: Color(int.parse("0xff${hexCircleAvatar}"))
            .withOpacity(1), // <-- Button color
        onPrimary: Colors.red, // <-- Splash color
      ),
    );
  }

  ElevatedButton buildElevatedButton2(IconData icon, Function function) {
    return ElevatedButton(
      onPressed: () => function(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        primary: Color(int.parse("0xff${hexCircleAvatar}"))
            .withOpacity(1), // <-- Button color
        onPrimary: Colors.red, // <-- Splash color
      ),
    );
  }

  Container maleOrfemaleContainer(String six, IconData icon) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(int.parse("0xff${hexStr}")).withOpacity(1)),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(
            icon,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "$six",
            style: TextStyle(color: Colors.white.withOpacity(.5)),
          ),
        ],
      ),
    );
  }
}
