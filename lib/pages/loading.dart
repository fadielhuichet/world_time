import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>  {

  void setupWorldTime() async{
    WorldTime tunis=WorldTime(location: 'Tunis', flag: 'tunis.png', url: 'Tunis');
    await tunis.getTime().timeout(Duration(seconds: 5));
    //print(tunis.time);
    //wait 2 seconds before navigating
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':tunis.location,
      'time':tunis.time,
      'flag':tunis.flag,
      'isDayTime':tunis.isDayTime,
    });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print("init state");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121B22),
      body: Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 80.0,
          )
      ),
    );
  }
}
