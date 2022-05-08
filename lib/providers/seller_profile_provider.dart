import 'package:aryanwheels_flutter/api_services/seller_profile_api.dart';
import 'package:aryanwheels_flutter/models/seller_profile_model.dart';
import 'package:flutter/cupertino.dart';

class SellerProfileProvider extends ChangeNotifier {
  SellerProfileModel _sellerProfileModel = SellerProfileModel();
  var isLoading = true ;

  Future<SellerProfileModel> getSellerProfileModel(int id) async{
    isLoading = true;
    _sellerProfileModel = await SellerProfileApi.getSellerProfile(id);
    isLoading = false;
    notifyListeners();
    return _sellerProfileModel;

  }

}
