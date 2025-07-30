import 'package:flutter/material.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/bike_service_screen/bike_service_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
  static const String bikeServiceScreen = '/bike_service_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
        homeScreen: (context) => HomeScreen(),
        bikeServiceScreen: (context) => BikeServiceScreen(),
        appNavigationScreen: (context) => AppNavigationScreen(),
        initialRoute: (context) => AppNavigationScreen()
      };
}
