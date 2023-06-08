import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';
import 'package:weatherapp_starter_project/widgets/sunrise_widget.dart';
import '../controllers/global_controller.dart';
import '../utils/api_url.dart';
import 'package:air_quality/air_quality.dart';
import '../widgets/daily_data_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //call global controller
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Cloud ",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              "Bits",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            )
          ]),
        ),
        body: SafeArea(
          child: Obx(() => globalController.checkLoading().isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),

                    //for our current temperature
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyDataWidget(
                        weatherDataHourly:
                            globalController.getData().getHourlyWeather()
                    ),

                    SizedBox(height: 20,),
                    /*DailyDataForecast(
                  weatherDataDaily: globalController.getData().getDailyData(),
                ),*/
                    //two cards, one to show sunrize and one to show sunset
                    SunriseWidget(
                      weatherDataCurrent: globalController.getData().getCurrentWeather(),
                    ),
                    SizedBox(height: 20,),

                  ],
                )),
        ));


  }


}
