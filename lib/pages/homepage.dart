import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Map data = {};

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // String bgimg = data['isDay'] ? 'day.jpg' : 'night.jpg';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bgm.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 110, 0, 0),
            child: Column(
              children: [
                Text(
                  "©Priyojit singha software solutions",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'flag': result['flag'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Edit location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'] ?? "Loading...",
                      style: TextStyle(
                          fontSize: 30, letterSpacing: 2, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  data['time'] ?? "Loading...",
                  style: TextStyle(
                      fontSize: 70,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
