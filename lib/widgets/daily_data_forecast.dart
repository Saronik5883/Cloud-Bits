import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import '../model/weather_data_daily.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
          width: 500,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: CustomColors.dividerLine.withAlpha(150),
          ),
          child: Column(children: [

          Container(
            height: 500,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            //return the item builder value as 10 if it more than 10
            itemCount: weatherDataDaily.daily.length > 20
                ? 20
                : weatherDataDaily.daily.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 300,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                getDay(weatherDataDaily.daily[index].dt),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              child: Image.network(
                                "http://openweathermap.org/img/wn/${weatherDataDaily.daily[index].weather![0].icon}.png",
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
        ),
          ),
            SizedBox(height: 150,)
          ])),
    );
  }

/*  Widget dailyList() {
    return
  }*/
}
