import '../screens/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String splashPage = "/splash-page";
  static String getSplashPage()=>'$splashPage';

  static List<GetPage> routes =[
  GetPage(name: splashPage, page: ()=>SplashScreen()),
  ];
}