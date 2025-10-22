import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;
  WorldTime({required this.location,required this.flag,required this.url});
  Future <void> getTime() async {

    try {
      Response response = await get(Uri.parse(
          'https://api.ipgeolocation.io/timezone?apiKey=6a217c7a070349d99d825a895ae0e84e&location=$url'));
      Map data = jsonDecode(response.body);
      print(data);
      String dateTime = data['date_time'];
      //String offset = data['timezone_offset'].toString();
      //print('DateTime:$dateTime');
      //print('Offset:$offset');

      //create a Datetime object
      DateTime now = DateTime.parse(dateTime);
      time = DateFormat.jm().format(now);

      isDayTime= now.hour>6 && now.hour<20 ? true : false;
    }catch(e){
      print('caught error:$e');
      time="could not get time data";
    }
  }

}


