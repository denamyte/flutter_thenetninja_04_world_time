import 'package:flutter/material.dart';
import 'package:thenetninja_04_world_time/pages/choose_location.dart';
import 'package:thenetninja_04_world_time/pages/home.dart';
import 'package:thenetninja_04_world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  initialRoute: "/home",
  routes: {
    "/": (context) => Loading(),
    "/home": (context) => Home(),
    "/location": (context) => ChooseLocation(),

  },
));

