import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/screens/home_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync: this,
        duration: const Duration(seconds: 1))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    Timer(
        const Duration(seconds: 2),
            ()=>Get.to(HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(scale: animation,
                child: Center(child: Image.asset("assets/icon/icon.png", width:500,))),
          ],
        )
    );
  }
}
