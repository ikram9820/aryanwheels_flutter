import '../models/seller_profile_model.dart';
import '../util/global_variable.dart';
import 'package:http/http.dart' as http;

class SellerProfileApi {


  static Future<SellerProfileModel> getSellerProfile(int id) async {
    final response = await http.get(Uri.parse("${Env.URL_PREFIX}/showroom/seller/$id"));
    if (response.statusCode == 200) {
      return  sellerProfileModelFromJson(response.body);
    }
    throw Exception('failed to load profile');
  }
}