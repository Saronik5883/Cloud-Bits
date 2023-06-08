import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatefulWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temperature area
        //temperatureAreaWidget(),
        Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${widget.weatherDataCurrent.current.weather![0].icon}.png",
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
        Container(
          height: 1,
          width: 50,
          color: Colors.grey,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text(
            '${widget.weatherDataCurrent.current.weather![0].description?.toUpperCase()}',
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 162,
              width: 150,
              child: Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                margin: EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(
                    '${widget.weatherDataCurrent.current.temp!}°',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  subtitle: Text(
                    //text for feels like
                    'Feels Like ${widget.weatherDataCurrent.current.feelsLike?.round()!}°',
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 241,
                  margin: EdgeInsets.only(right: 10),
                  //color: CustomColors.cardColor,
                  //Card showing the humidity
                  child: Card(

                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(Icons.water_drop_outlined,
                          color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        '${widget.weatherDataCurrent.current.humidity!}%',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                      ),
                      subtitle: Text(
                        'Humidity',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          color: Theme.of(context).disabledColor,),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  width: 241,
                  //Card for displaying the UV Index
                  child: Card(
                    child: ListTile(
                      leading: IconButton.filledTonal(
                        icon: Icon(Icons.wb_sunny_outlined,
                          color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                      title: Text(
                        '${widget.weatherDataCurrent.current.uvi!}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            ),
                      ),
                      subtitle: Text(
                        'UV Index',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).disabledColor,),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
        const SizedBox(
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
                        icon: Icon(Icons.wind_power_outlined, color: Theme.of(context).colorScheme.primary,),
                        onPressed: () {},
                      ),
                        title: Text(
                          '${widget.weatherDataCurrent.current.windSpeed!} m/s',
                            style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,

                            ),
                      ),
                        subtitle: Text(
                        'Wind Speed',
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
                      icon: Icon(Icons.cloud_outlined, color: Theme.of(context).colorScheme.primary,),
                    onPressed: () {},
                  ),
                    title: Text(
                        '${widget.weatherDataCurrent.current.clouds!}%',
                          style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                            'Clouds',
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
}
