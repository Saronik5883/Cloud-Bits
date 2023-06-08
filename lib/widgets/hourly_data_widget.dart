import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import '../model/weather_data_hourly.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  //card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: const Text(
            "Hourly Forecast",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDataHourly.hourly!.length > 12
                ? 12
                : weatherDataHourly.hourly!.length,
            itemBuilder: (context, index) {
              return Obx((() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Card(

                    child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      temp: weatherDataHourly.hourly![index].temp!,
                      timestamp: weatherDataHourly.hourly![index].dt!,
                      weatherIcon:
                      weatherDataHourly.hourly![index].weather![0].icon!,
                    ),
                  ),
                ),
              )));
            },
          ),
        )
      ],
    );
  }

/*  Widget hourlyList() {
    return ;
  }*/
}

//hourly details

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timestamp;
  String weatherIcon;
  HourlyDetails(
      {Key? key,
      required this.timestamp,
      required this.index,
      required this.cardIndex,
      required this.temp,
      required this.weatherIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).hour}:00",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
