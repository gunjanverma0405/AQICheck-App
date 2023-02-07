import 'package:aqi_app/screens/AQIPage.dart';
import 'package:aqi_app/services/aqi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  getLocationData() async {
    AqiModel aqiModel = AqiModel();
    var aqiData = await aqiModel.getLocationAQI();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AQIPage(locationAqi: aqiData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
          child: SpinKitPouringHourGlass(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
