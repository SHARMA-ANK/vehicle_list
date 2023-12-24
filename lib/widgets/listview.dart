import 'package:flutter/material.dart';
import 'package:vehicle_list/models/vehicle.dart';
import 'package:vehicle_list/widgets/vehicle_detrails.dart';
class ListShow extends StatelessWidget {
  ListShow({super.key,required this.listVehicle,required this.remove});
  final List<Vehicle> listVehicle;
  void Function(Vehicle) remove;

  @override
  Widget build(BuildContext context) {
    Widget presentScreen=ListView.builder(
        itemCount: listVehicle.length,
        itemBuilder: (context,index){
          return VehicleDetails(vehicle: listVehicle[index],remove: remove,);
        }
    );
    if(listVehicle.isEmpty){
      presentScreen=Center(

        child: Text("NO DATA OF VEHICLE AVAILABLE. ADD VEHICLE")
      );
    }
    return presentScreen;
  }
}
