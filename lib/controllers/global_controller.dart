import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/model/weather_data.dart';

class GlobalController extends GetxController {
  //create variables
  final RxBool _isLoading = true.obs;
  final RxDouble latitute = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  //instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLat() => latitute;
  RxDouble getLong() => longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData() => weatherData.value;

  @override
  void onInit() {
    if (_isLoading == true) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    //status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
      //request permission
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    //getting current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitute.value = value.latitude;
      longitude.value = value.longitude;
      //calling our weather api
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
