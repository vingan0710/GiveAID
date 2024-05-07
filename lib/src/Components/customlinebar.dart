import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class CustomLineBar extends StatelessWidget {
  final double width;
  final double height;
  final double number;
  final Color color;

  const CustomLineBar(
      {super.key,
      required this.width,
      required this.height,
      required this.number,required this.color});

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      width: width,
      height: height,
      value: number,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.orange.shade300, Colors.deepOrange],
      ),
      backgroundColor: color,
    );
  }
}

class CustomAchieved extends StatelessWidget {
  final String money;
  final String number;
  final double fontSizeM;
  final double fontSizeN;

  const CustomAchieved(
      {super.key,
      required this.money,
      required this.number,
      required this.fontSizeM,
      required this.fontSizeN});

  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text('Achieved ', style: TextStyle(fontSize: 17)),
            Text(money,
                style: TextStyle(
                    fontSize: fontSizeM,
                    color: Color.fromARGB(255, 255, 111, 15),
                    fontWeight: FontWeight.bold))
          ]),
          Text(number,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizeN))
        ]);
  }
}
