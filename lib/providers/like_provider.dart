import '../models/like_model.dart';
import 'package:flutter/cupertino.dart';
import '../api_services/like_api.dart';
import 'package:provider/provider.dart';

class LikeProvider extends ChangeNotifier {
  late Like like ;
  List<int?> isLiked =[] ;
  LikeProvider() {
    setLike();
  }

  Future<void> setLike() async{
    like = await LikeApi.getLikedPosts();
    like.likedPosts?.map((e) => print("this is like posts"+e.toString() ));

    like.likedPosts?.map((e) => isLiked.add(e.vehicle?.id));
    notifyListeners();
  }

  // bool isLiked  (int vehicleId){
  //   like.likedPosts?.map((e){
  //    if(e.vehicle?.id==vehicleId) {
  //      return true;
  //    }
  //  });
  //   return false;
  // }

  Future<void> addLike(int vehicleId) async{
    await LikeApi.addLikedPost(vehicleId);
    await setLike();
    notifyListeners();
  }

}