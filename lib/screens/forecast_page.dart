import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/widgets/daily_data_forecast.dart';
import 'package:get/get.dart';
import '../controllers/global_controller.dart';
import '../model/weather_data_daily.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}
String getDay(final day) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
  final x = DateFormat('MMMEd').format(time);
  return x;
}
class _ForecastPageState extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);

    final WeatherDataDaily weatherDataDaily = globalController.getData().getDailyData();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forecast", style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                      child: CircularProgressIndicator(),
                    )
            : ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          //return the item builder value as 10 if it more than 10
          itemCount: weatherDataDaily.daily.length > 20
              ? 20
              : weatherDataDaily.daily.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 150,
              width: 300,
              child: Card(
                child: Column(

                  children: [
                ListTile(
                        leading: Image.asset(
                          "assets/weather/${weatherDataDaily.daily![index].weather![0].icon!}.png",
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          getDay(weatherDataDaily.daily![index].dt!),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          weatherDataDaily.daily![index].weather![0].description!,
                          style: const TextStyle(
                              fontSize: 16),
                        ),
                        trailing: Text(
                          '${weatherDataDaily.daily![index].temp!.day!.round()}°C',
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                    SizedBox(height: 10,),
                    //A row with icon buttons for humidity, wind speed and cloud cover
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // 2 elevated buttons, one for windspeed and one for cloud cover
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.wind_power_outlined),
                              SizedBox(width: 10,),
                              Text(
                                '${weatherDataDaily.daily![index].windSpeed!.round()} m/s',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        //Elevated Button showing the cloud cover
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.cloud_outlined),
                              SizedBox(width: 10,),
                              Text(
                                '${weatherDataDaily.daily![index].clouds!.round()}%',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        //FilledButton.tonal for displaying the humidity
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.water_drop_outlined),
                              SizedBox(width: 10,),
                              Text(
                                '${weatherDataDaily.daily![index].humidity!.round()}%',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

              ),
            );
          },
        ),
        ),
      ),
    );
  }
}
