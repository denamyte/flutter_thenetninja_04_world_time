import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  // location name for the UI
  String time;  // the time in that location
  String flag;  // URL to an asset flag icon
  String url;  // location URL for API endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // http://worldtimeapi.org/api/timezone/Europe/London
      http.Response response = await http.get(Uri.https('worldtimeapi.org', '/api/timezone/$url'));
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));
      // now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour >= 6 && now.hour < 20;
      // set the time property
      time = DateFormat.jm().format(now);
    } catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

}
