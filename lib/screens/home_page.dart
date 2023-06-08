import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/screens/weather_page.dart';

import 'forecast_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  void onTapNav(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  List<Widget> _buildScreens() {
    return [
      WeatherPage(),
      ForecastPage(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
        labelBehavior: labelBehavior,
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined,),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.cloud_circle,),
            label: "Forecast",
          ),
        ],
      ),
    );
  }
}
