import 'package:aryanwheels_flutter/models/vehicles_model.dart';
import 'package:aryanwheels_flutter/api_services/vehicle_api.dart';
import 'package:flutter/cupertino.dart';


class VehiclesProvider extends ChangeNotifier {
  AllVehicles _allVehicles= AllVehicles(count: 0, vehicles: []);
  List<Vehicle> vehicles=[];
  int count=0;
  var isLoading;

  VehiclesProvider(){
    setVehicles();
  }

    void setVehicles() async {
    isLoading = true;
    _allVehicles = await VehicleApi.getVehicleList();
    isLoading = false;
    vehicles= _allVehicles.vehicles!;
    setCount();
    notifyListeners();
  }

  void setCount(){
     count= vehicles.length;
     notifyListeners();

  }

}