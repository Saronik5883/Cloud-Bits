import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/routes/route_helper.dart';
import 'package:weatherapp_starter_project/screens/home_page.dart';
import 'package:weatherapp_starter_project/screens/weather_page.dart';

void main() {
  runApp(const MyApp());
}
Color brandColor = Color(0xFF4166f5);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? dark) {
        ColorScheme lightColorScheme;
        ColorScheme darkColorScheme;

        final brightness = MediaQuery.of(context).platformBrightness;

        if (lightDynamic != null && dark != null) {
          lightColorScheme = lightDynamic.harmonized()..copyWith();
          lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
          darkColorScheme = dark.copyWith(secondary: brandColor);
        } else {
          lightColorScheme = ColorScheme.fromSeed(
              seedColor: brandColor, brightness: Brightness.light);
          darkColorScheme = ColorScheme.fromSeed(
              seedColor: brandColor, brightness: Brightness.dark);
        }

        final colorScheme = brightness == Brightness.dark
            ? darkColorScheme
            : lightColorScheme;

        return MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            fontFamily: 'Roboto',
            colorScheme: colorScheme,
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

}
