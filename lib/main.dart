import 'package:flutter/material.dart';
import 'package:music_app_ui/Intropages/Onboarding.dart';
import 'package:music_app_ui/Pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pres = await SharedPreferences.getInstance();
  final onboarding = pres.getBool("onboarding")??false;
  runApp(MyApp(onboarding: onboarding,));
}

class MyApp extends StatelessWidget{
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: onboarding? const Home() : const OnBoarding(),
    );
  }
}
