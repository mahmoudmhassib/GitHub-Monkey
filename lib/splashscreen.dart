import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:monekyapp/screens/homescreen.dart';
import 'package:monekyapp/screens/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  EasySplashScreen(
        logo: Image.asset('lib/images/login/Group 873.png',color: Colors.white,),
        navigator:HomeScreen(),
        backgroundColor:Color(0xFFFC6011),
        durationInSeconds: 3,
      showLoader: false,
      title: Text('Meal Monkey',style: TextStyle(fontSize: 34,color: Colors.white,fontWeight: FontWeight.bold)),
    );
  }
}
