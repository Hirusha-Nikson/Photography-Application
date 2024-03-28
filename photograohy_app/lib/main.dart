import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:photograohy_app/pages/Compositions/comp_camera.dart';
import 'package:photograohy_app/pages/Home/home_page.dart';
import 'package:photograohy_app/pages/exposure_time/exposure_time.dart';
>>>>>>> Stashed changes
import 'package:photograohy_app/pages/splash_page.dart';
import 'package:photograohy_app/theme/dark_mode.dart';
import 'package:photograohy_app/theme/light_mode.dart';
import 'package:photograohy_app/weather/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: lightMode,
      darkTheme: darkMode,
<<<<<<< Updated upstream
=======
      routes: {
        '/homepage': (context) => const Home(),
        '/exposure_time': (context) => const Exposure(),
        '/comp_camera': (context) => const Compositon(),
        '/weather': (context) => const WeatherPage(),
      },
>>>>>>> Stashed changes
    );
  }
}
