import 'package:flutter/material.dart';
import 'package:aqi_app/services/aqi.dart';

class AQIPage extends StatefulWidget {
  const AQIPage({super.key});

  @override
  State<AQIPage> createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  int? aqi;
  double? co, no, no2, o3, so2, pm2_5, pm10, nh3;
  String? qname;

  AqiModel aqiModel = AqiModel();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    var aqiData = await aqiModel.getLocationAQI();
    setState(() {
      aqi = aqiData['list'][0]['main']['aqi'];
      co = aqiData['list'][0]['components']['co'];
      no = aqiData['list'][0]['components']['no'];
      no2 = aqiData['list'][0]['components']['no2'];
      o3 = aqiData['list'][0]['components']['o3'];
      so2 = aqiData['list'][0]['components']['so2'];
      pm2_5 = aqiData['list'][0]['components']['pm2_5'];
      pm10 = aqiData['list'][0]['components']['pm10'];
      nh3 = aqiData['list'][0]['components']['nh3'];
      if (aqi == 1) {
        qname = "Good";
      } else if (aqi == 2) {
        qname = "Fair";
      } else if (aqi == 3) {
        qname = "Moderate";
      } else if (aqi == 4) {
        qname = "Poor";
      } else if (aqi == 5) {
        qname = "Very Poor";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('AQI: $aqi'),
          const SizedBox(
            height: 5,
          ),
          Text('CO: $co'),
          const SizedBox(
            height: 5,
          ),
          Text('NO: $no'),
          const SizedBox(
            height: 5,
          ),
          Text('NO2: $no2'),
          const SizedBox(
            height: 5,
          ),
          Text('O3: $o3'),
          const SizedBox(
            height: 5,
          ),
          Text('So2: $so2'),
          const SizedBox(
            height: 5,
          ),
          Text('PM 2.5: $pm2_5'),
          const SizedBox(
            height: 5,
          ),
          Text('PM 10: $pm10'),
          const SizedBox(
            height: 5,
          ),
          Text('NH3: $nh3'),
          const SizedBox(
            height: 5,
          ),
          Text('$qname'),
        ],
      )),
    );
  }
}
