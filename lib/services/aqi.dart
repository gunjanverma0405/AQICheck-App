import 'package:aqi_app/services/location.dart';
import 'package:aqi_app/services/networking.dart';

const airPollutionUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';
String apiKey = '5e907d0ecd336b872084b2c295aa8ca4';

class AqiModel {
  Future<dynamic> getLocationAQI() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        '$airPollutionUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var aqiData = await networkHelper.getData();
    return aqiData;
  }
}
