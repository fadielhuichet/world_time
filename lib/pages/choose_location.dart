import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Tunis', flag: 'tunis.png', url: 'Africa/Tunis'),
    WorldTime(location: 'London', flag: 'london.jpg', url: 'Europe/London'),
    WorldTime(location: 'Paris', flag: 'france.webp', url: 'Europe/Paris'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
    WorldTime(location: 'Dubai', flag: 'uae.jpg', url: 'Asia/Dubai'),
    WorldTime(location: 'Rio de Janeiro', flag: 'brazil.webp', url: 'Brazil'),
  ];

  void UpdateTime(index) async{
    WorldTime instance=locations[index];

    await instance.getTime().timeout(Duration(seconds: 5));
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121B22),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F2C34),
        iconTheme: IconThemeData(color: Colors.white),
        title:Text(
            "Choose Location",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        elevation:0,

      ),
      body:ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:locations.length,
          itemBuilder:(context,index){
            return Card(
              child:ListTile(
                onTap: (){
                  UpdateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            );
          }

      ),


    );
  }
}
