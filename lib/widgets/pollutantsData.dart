import 'package:flutter/material.dart';

class PollutantsData extends StatelessWidget {
  final String pollutantName;
  double? level;
  Color? aqiColor;

  PollutantsData(
      {super.key, required this.pollutantName, this.level, this.aqiColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: aqiColor,
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 3,
                color: Colors.brown,
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('$level',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                )),
          ),
        ),
        Text(pollutantName,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
