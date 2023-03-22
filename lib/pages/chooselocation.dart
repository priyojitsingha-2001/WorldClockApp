import 'package:flutter/material.dart';
import 'package:world_app/services/worldtime.dart';

class chooselocation extends StatefulWidget {
  const chooselocation({super.key});

  @override
  State<chooselocation> createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {
  List<worldtime> locations = [
    worldtime(
        location: 'Newyork', flag: 'america.jpg', url: 'America/New_York'),
    worldtime(
        location: 'South Korea', flag: 'south korea.jpg', url: 'Asia/Seoul'),
    worldtime(
        location: 'Argentina',
        flag: 'argentina.jpg',
        url: 'America/Argentina/Buenos_Aires'),
    worldtime(location: 'Brazil', flag: 'brazil.jpg', url: 'America/Sao_Paulo'),
    worldtime(location: 'Japan', flag: 'japan.jpg', url: 'Asia/Tokyo'),
    worldtime(location: 'Kolkata', flag: 'India.jpg', url: 'Asia/Kolkata'),
  ];

  void updateTime(index) async {
    worldtime instance = locations[index];
    await instance.getTime();
    //navigate to home screen with the data
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("choose loaction"),
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text('${locations[index].location}'),
              ));
            }));
  }
}
