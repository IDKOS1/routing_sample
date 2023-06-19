import 'package:flutter/material.dart';
import 'package:navigater_practice/screen/home_screen.dart';
import 'package:navigater_practice/screen/route_one_screen.dart';
import 'package:navigater_practice/screen/route_two_screen.dart';
import 'package:navigater_practice/screen/route_three_screen.dart';

const HOME_ROUTE = '/';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        HOME_ROUTE : (context) => HomeScreen(),
        '/one': (context) => RouteOneScreen(),
        '/two': (context) => RouteTwoScreen(),
        '/three': (context) => RouteThreeScreen(),
      },
    ),
  );
}
