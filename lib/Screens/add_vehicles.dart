import 'package:flutter/material.dart';
import 'package:vehicle_list/models/vehicle.dart';
class VehicleDetailsForm extends StatefulWidget {
  const VehicleDetailsForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleDetailsFormState createState() => _VehicleDetailsFormState();
}

class _VehicleDetailsFormState extends State<VehicleDetailsForm> {
  // Dummy data for dropdowns
  List<String> brands = ['Hero', 'Hyundai', 'Ford','Toyota','Bajaj','Mahindra','Tata'];
  List<String> vehicleTypes = ['Bike', 'Car'];
  List<String> fuelTypes = ['Diesel', 'Petrol'];

  // Form fields
  TextEditingController vehicleNumberController = TextEditingController();
  String? selectedBrand;
  String? selectedVehicleType;
  String? selectedFuelType;
  void _submitVehicle(){
    Vehicle newVehicle=Vehicle(
        brandname: selectedBrand!,
        fueltype: selectedFuelType!,
        vehicle_no: vehicleNumberController.text,
        vehicle_type: selectedVehicleType!
    );
    Navigator.of(context).pop(newVehicle);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: vehicleNumberController,
              decoration: const InputDecoration(labelText: 'Vehicle Number'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedBrand,
              hint: const Text('Select Brand'),
              onChanged: (value) {
                setState(() {
                  selectedBrand = value;
                });
              },
              items: brands.map((brand) {
                return DropdownMenuItem<String>(
                  value: brand,
                  child: Text(brand),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedVehicleType,
              hint: const Text('Select Vehicle Type'),
              onChanged: (value) {
                setState(() {
                  selectedVehicleType = value;
                });
              },
              items: vehicleTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedFuelType,
              hint: const Text('Select Fuel Type'),
              onChanged: (value) {
                setState(() {
                  selectedFuelType = value;
                });
              },
              items: fuelTypes.map((fuel) {
                return DropdownMenuItem<String>(
                  value: fuel,
                  child: Text(fuel),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitVehicle,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}