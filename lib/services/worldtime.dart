import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime {
  String location; //name of the location
  String time = ""; //time in that location
  String flag; // to store the flag of that location
  String url; //this is the location url for the api end point
  bool isDay = true; // true or false depending on day or night

  worldtime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //making request fro the api
      var response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response
          .body); //converting the JSON response to Map for easy retrival of data

      //taking the data that we need from the response
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      int hours = int.parse(offset.substring(1, 3));
      int minutes = int.parse(offset.substring(4, 6));

      //create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: hours, minutes: minutes));

      time = DateFormat.jm().format(now);
    } catch (e) {
      print("CAUGHT AN ERROR $e");
      time = "oops! couldn't get time";
    }
  }
}
