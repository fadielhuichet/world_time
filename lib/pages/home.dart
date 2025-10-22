import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map? ??{};
    print(data);
    String bgImage= data['isDayTime'] ? 'day.jpeg':'night.jpg';
    var time=data["time"];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
                  children: [
                    Text(
                        data["location"],
                        style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 25.0),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                        time,
                        style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data['flag']}'),

                    ),
                    ElevatedButton.icon(
                        onPressed:() async{
                          dynamic result= await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data={
                              'time':result['time'],
                              'location':result['location'],
                              'flag':result['flag'],
                              'isDayTime':result['isDayTime'],
                            };
                          });
                        },
                        label: Text(
                            'Edit Location',
                            style: TextStyle(color: Colors.black),
        
                        ),
                        icon:Icon(
                            Icons.edit_location,
                            color: Colors.black,
        
                        ),
                    ),
        
                  ],
                ),
        ),
      ),



    );
  }
}


