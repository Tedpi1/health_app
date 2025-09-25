

import 'package:flutter/material.dart';
import 'package:health_app/widgets/card/threecard.dart';
import 'package:health_app/widgets/sidebar.dart';

import '../widgets/appbar/appbar.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(role: 1),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              greetingWidget('Jane'),
              Padding(padding: const EdgeInsets.all(20),

              ),
              const SizedBox(height: 20.0,),
        ThreeCardsWidget(
        titles: ['Temp', 'Weight', 'Pressure'],
        subtitles: ['20°C', '75kg', '133Pa'],
        icons: [
          Icons.thermostat,   // For Temperature 🌡️
          Icons.monitor_weight, // For Weight ⚖️
          Icons.speed,        // For Pressure (gauge-like) ⏱️
        ],
      )

      ],
        ),
      ),
    );
  }
}


Widget greetingWidget(String name) {
  return Text(
    "Hello, $name 👋",
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}