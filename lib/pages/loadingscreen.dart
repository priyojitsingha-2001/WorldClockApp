import 'package:flutter/material.dart';
import 'package:world_app/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({super.key});

  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

String time = "Loading";

class _loadingscreenState extends State<loadingscreen> {
  void setup_time() async {
    worldtime obj =
        worldtime(location: 'Kolkata', flag: 'india', url: 'Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj.location,
      'flag': obj.flag,
      'time': obj.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setup_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 70.0,
        ),
      ),
    );
  }
}
