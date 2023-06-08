import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class SunriseWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  SunriseWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    var sunrise = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(weatherDataCurrent.current.sunrise! * 1000));
    var sunset = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(weatherDataCurrent.current.sunset! * 1000));

    return Column(
      children: [
        //temperature area
        //temperatureAreaWidget(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 1,
          width: 300,
          color: Colors.grey,
        ),
        SizedBox(
          height: 20,
        ),
        //more details - windspeed, humidity, clouds
        //currentWeatherMoreDetailsWidget(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 2 cards, one for windspeed and one for cloud cover
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 80,
                  width: 197,
                  //color: CustomColors.cardColor,
                  //Card showing the humidity
                  child: Card(
                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(CupertinoIcons.sunrise,
                          color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        //text for sunrise time, it needs to be converted from unix time
                        '$sunrise',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'Sunrise',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                            color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                //card for clouds
                Container(
                  height: 80,
                  width: 189,
                  margin: EdgeInsets.only(right: 10),
                  //color: CustomColors.cardColor,
                  //Card showing the humidity
                  child: Card(
                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(CupertinoIcons.sunset, color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        '${sunset}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          //color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Sunset',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 2 cards, one for windspeed and one for cloud cover
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 80,
                  width: 197,
                  //color: CustomColors.cardColor,
                  //Card showing the humidity
                  child: Card(
                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(Icons.bar_chart_outlined, color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        //text for sunrise time, it needs to be converted from unix time
                        '${weatherDataCurrent.current.pressure} hPa',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'Pressure',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                //card for clouds
                Container(
                  height: 80,
                  width: 189,
                  margin: EdgeInsets.only(right: 10),
                  //color: CustomColors.cardColor,
                  //Card showing the humidity
                  child: Card(
                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        '${weatherDataCurrent.current.visibility! / 1000} km',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          //color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        'Visibility',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ],
    );
  }

// Widget temperatureAreaWidget() {
//   return
// }

/*  Widget currentWeatherMoreDetailsWidget() {
    return
  }*/
}
