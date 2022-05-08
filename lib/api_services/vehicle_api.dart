import '../models/vehicles_model.dart';
import '../util/global_variable.dart';
import 'package:http/http.dart' as http;

class VehicleApi {


  static Future<AllVehicles> getVehicleList() async {
    final response = await http.get(Uri.parse("${Env.URL_PREFIX}/showroom/vehicles/"));
    print("${response.statusCode} : ${response.body}");
     if (response.statusCode == 200) {
      return  allVehiclesFromJson(response.body);
    }
    throw Exception('failed to load vehicles');
  }
}