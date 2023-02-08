import 'dart:developer';

import 'package:aqi_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:aqi_app/services/aqi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AQIPage extends StatefulWidget {
  const AQIPage({super.key, this.locationAqi});
  final locationAqi;

  @override
  State<AQIPage> createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  int aqi = 0;
  String? qname;
  Color? aqiColor;
  var levels = Map();
  List<String> pollutants = [
    'CO',
    'NO',
    'NO\u2082',
    'O\u2083',
    'So\u2082',
    'PM 2.5',
    'PM 10',
    'NH\u2083',
  ];

  AqiModel aqiModel = AqiModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationAqi);
  }

  void updateUI(dynamic aqiData) {
    setState(() {
      aqi = aqiData['list'][0]['main']['aqi'];
      levels['CO'] = aqiData['list'][0]['components']['co'];
      levels['NO'] = aqiData['list'][0]['components']['no'];
      levels['NO\u2082'] = aqiData['list'][0]['components']['no2'];
      levels['O\u2083'] = aqiData['list'][0]['components']['o3'];
      levels['So\u2082'] = aqiData['list'][0]['components']['so2'];
      levels['PM 2.5'] = aqiData['list'][0]['components']['pm2_5'];
      levels['PM 10'] = aqiData['list'][0]['components']['pm10'];
      levels['NH\u2083'] = aqiData['list'][0]['components']['nh3'];
      if (aqi == 1) {
        qname = "Good, Satisfactory";
        aqiColor = const Color.fromARGB(255, 11, 167, 17);
      } else if (aqi == 2) {
        qname = "Fair, Acceptable";
        aqiColor = const Color.fromARGB(255, 128, 219, 116);
      } else if (aqi == 3) {
        qname = "Moderate, Unhealthy";
        aqiColor = const Color(0xFFFFBA00);
      } else if (aqi == 4) {
        qname = "Poor, Very Unhealthy";
        aqiColor = const Color.fromARGB(255, 216, 105, 31);
      } else if (aqi == 5) {
        qname = "Very Poor, Hazardous";
        aqiColor = const Color.fromARGB(255, 171, 0, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text(
          "Pollution Levels",
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.brown[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              showLabels: false,
                              // showAxisLine: false,
                              // showTicks: false,
                              minimum: 0.5,
                              maximum: 5.5,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0.5,
                                    endValue: 1.5,
                                    color:
                                        const Color.fromARGB(255, 11, 167, 17),
                                    label: 'Good',
                                    sizeUnit: GaugeSizeUnit.factor,
                                    labelStyle: const GaugeTextStyle(
                                        fontSize: 20, color: Colors.white),
                                    startWidth: 0.65,
                                    endWidth: 0.65),
                                GaugeRange(
                                    startValue: 1.5,
                                    endValue: 2.5,
                                    color: const Color.fromARGB(
                                        255, 128, 219, 116),
                                    label: 'Fair',
                                    sizeUnit: GaugeSizeUnit.factor,
                                    labelStyle: const GaugeTextStyle(
                                        fontSize: 20, color: Colors.white),
                                    startWidth: 0.65,
                                    endWidth: 0.65),
                                GaugeRange(
                                  startValue: 2.5,
                                  endValue: 3.5,
                                  color: const Color(0xFFFFBA00),
                                  label: 'Moderate',
                                  labelStyle: const GaugeTextStyle(
                                      fontSize: 20, color: Colors.white),
                                  startWidth: 0.65,
                                  endWidth: 0.65,
                                  sizeUnit: GaugeSizeUnit.factor,
                                ),
                                GaugeRange(
                                  startValue: 3.5,
                                  endValue: 4.5,
                                  color:
                                      const Color.fromARGB(255, 216, 105, 31),
                                  label: 'Poor',
                                  labelStyle: const GaugeTextStyle(
                                      fontSize: 20, color: Colors.white),
                                  sizeUnit: GaugeSizeUnit.factor,
                                  startWidth: 0.65,
                                  endWidth: 0.65,
                                ),
                                GaugeRange(
                                  startValue: 4.5,
                                  endValue: 5.5,
                                  color: const Color.fromARGB(255, 171, 0, 0),
                                  label: 'Very Poor',
                                  labelStyle: const GaugeTextStyle(
                                      fontSize: 20, color: Colors.white),
                                  sizeUnit: GaugeSizeUnit.factor,
                                  startWidth: 0.65,
                                  endWidth: 0.65,
                                ),
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: aqi.toDouble())
                              ])
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: aqiColor,
                      child: SizedBox(
                        width: 300,
                        height: 70,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Air Quality Index: $aqi",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '$qname',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyCardWidget(
                      pollutants: pollutants,
                      levels: levels,
                      aqiColor: aqiColor,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
