import 'package:flutter/material.dart';
import 'package:health_app/widgets/card/linegraph.dart';
import 'package:health_app/widgets/card/threecard.dart';
import 'package:health_app/widgets/sidebar.dart';

import '../../widgets/appbar/appbar.dart';
import '../../widgets/card/graph_card.dart';
import '../../widgets/models/models.dart';

class Homepage extends StatefulWidget {
  final int role; // role passed in

  const Homepage({super.key, required this.role});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(role: widget.role), // use passed role
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            greetingWidget('Jane'),
            const SizedBox(height: 20.0),

            // Example: show different cards for different roles
            if (widget.role == 1) ...[
              // Director (Admin)
              ThreeCardsWidget(
                titles: ['Doctors', 'Patients', 'Reports'],
                subtitles: ['15', '230', '12'],
                icons: [Icons.person, Icons.people, Icons.insert_chart],
              ),
              graphsWidget(
                  titles: ["Doctors","Patients"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              ),
              linesgraph(
                  titles: ["Doctors","Patients"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              )
            ] else if (widget.role == 2) ...[
              // Doctor
              ThreeCardsWidget(
                titles: ['Appointments', 'Prescriptions', 'Lab Results'],
                subtitles: ['5 Today', '12 Issued', '8 Pending'],
                icons: [Icons.calendar_today, Icons.medical_services, Icons.biotech],
              ),
              graphsWidget(
                  titles: ["Appointments","Lab Results"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              ),
              linesgraph(
                  titles: ["Appointments","Lab Results"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              )
            ] else if (widget.role == 3) ...[
              // Patient
              ThreeCardsWidget(
                titles: ['Temp', 'Weight', 'Pressure'],
                subtitles: ['20°C', '75kg', '133Pa'],
                icons: [
                  Icons.thermostat,
                  Icons.monitor_weight,
                  Icons.speed,
                ],
              ),
              graphsWidget(
                  titles: ["Temperature","Weight"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              ),
              linesgraph(
                  titles: ["Temperature","Weight"],
                  data: [
                    [
                      ChartData("Jan", 40),
                      ChartData("Feb", 55),
                      ChartData("Mar", 30),
                    ],
                    [
                      ChartData("Jan", 10),
                      ChartData("Feb", 20),
                      ChartData("Mar", 15),
                    ],
                  ]
              )
            ] else ...[
              const Text("Role not recognized 🚫"),
            ],


          ],
        ),
      ),
    );
  }
}

/// Greeting Widget
Widget greetingWidget(String name) {
  return Text(
    "Hello, $name 👋",
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}
