import 'package:flutter/material.dart';
import 'package:vehicle_list/models/vehicle.dart';
import 'package:vehicle_list/widgets/rowInfo.dart';

class VehicleDetails extends StatelessWidget {
  VehicleDetails({super.key,required this.vehicle,required this.remove});
  final Vehicle vehicle;
  void Function(Vehicle) remove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInfo(role: "Vehicle Number",  value: vehicle.vehicle_no),
                TextInfo(role: "Vehicle Type", value: vehicle.vehicle_type),
                TextInfo(role: "Vehicle Brand", value: vehicle.brandname),
                TextInfo(role: "Fuel Type", value: vehicle.fueltype)

              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: (){
                remove(vehicle);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
