import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {

  String location;  // location name for the UI
  String time;  // the time in that location
  String flag;  // URL to an asset flag icon
  String url;  // location URL for API endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // http://worldtimeapi.org/api/timezone/Europe/London
      http.Response response = await http.get(Uri.https('worldtimeapi.org', '/api/timezoned/$url'));
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime).add(Duration(hours: int.parse(offset)));
      // now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      time = now.toString();
    } catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }

}
