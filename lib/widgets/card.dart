import 'package:aqi_app/widgets/pollutantsData.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  var levels;
  final List<String> pollutants;
  final Color? aqiColor;

  MyCardWidget(
      {super.key,
      required this.pollutants,
      required this.levels,
      required this.aqiColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.brown[50],
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pollutants Level',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 10.0,
                  children: List.generate(
                    pollutants.length,
                    (index) {
                      return PollutantsData(
                        pollutantName: pollutants[index],
                        level: levels[pollutants[index]],
                        aqiColor: aqiColor,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
