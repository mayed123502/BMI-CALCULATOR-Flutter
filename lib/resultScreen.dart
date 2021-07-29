import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/myProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fonts.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse("0xff${hexString}")).withOpacity(.85),
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              "Your result",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 460,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 13),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(int.parse("0xff${hexStr}")).withOpacity(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${Provider.of<MyProvider>(context, listen: false).getResult()}",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                    "${Provider.of<MyProvider>(context, listen: false).bmi.roundToDouble()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${Provider.of<MyProvider>(context, listen: false).getInterpretation()}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(
              top: 20,
            ),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Provider.of<MyProvider>(context, listen: false).restart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              color: Color(int.parse("0xff${raisedButton}")).withOpacity(1),
              child: Text(
                "RE_CALCULATE",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
