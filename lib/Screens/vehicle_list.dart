import 'package:flutter/material.dart';
import 'package:vehicle_list/Screens/add_vehicles.dart';
import 'package:vehicle_list/models/vehicle.dart';
import 'package:vehicle_list/widgets/listview.dart';
class VehiclesList extends StatefulWidget {
  const VehiclesList({super.key});

  @override
  State<VehiclesList> createState() => _VehiclesListState();
}

class _VehiclesListState extends State<VehiclesList> {
  final List<Vehicle> carList=[];

  final List<Vehicle> bikeList=[];
  final presentScreen='VehicleList';

  void addvehicle() async{

    final Vehicle result = await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>VehicleDetailsForm()));
    // ignore: unnecessary_null_comparison
    if(result==null) return;
    setState(() {
      if(result.vehicle_type=='Car') {
        carList.add(result);
      } else {
        bikeList.add(result);
      }
    });

  }
  void removeVehicle(Vehicle vehicle){
    setState(() {
      if(vehicle.vehicle_type=="Car"){
        carList.remove(vehicle);
      }else{
        bikeList.remove(vehicle);
      }
    });

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Vehicles List"),
        bottom: const TabBar(tabs: [
          Tab(
            text: "Car",
            icon: Icon(Icons.local_taxi),
          ),
          Tab(
            text: "MotorCycle",
            icon: Icon(Icons.motorcycle),
          )
        ]

        )
      ),body:TabBarView(
        children: [

           ListShow(listVehicle: carList,remove: removeVehicle,),
            ListShow(listVehicle: bikeList,remove: removeVehicle,)
        ],
      ),
      bottomNavigationBar: TextButton.icon(
          onPressed: addvehicle,
          icon: const Icon(Icons.add),
          label: const Text("Add Vehicle")
      ),
    );
  }
}
