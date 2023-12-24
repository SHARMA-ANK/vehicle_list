import 'package:flutter/material.dart';
import 'package:vehicle_list/Screens/vehicle_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Vehicles_List",
      home: DefaultTabController(
          length: 2,
          child: VehiclesList()
      )
    );
  }
}
