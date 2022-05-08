import 'dart:convert';
import '../models/like_model.dart';
import '../util/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LikeApi{
  static Future<void>setLikeIdPref(String id) async{
    var likeIdPref = await SharedPreferences.getInstance();
    likeIdPref.setString("likeId", id);
  }

  static Future<String?> getLikeId() async{
    var likeIdPref = await SharedPreferences.getInstance();
    return likeIdPref.getString("likeId");
  }

  static Future<void> createLikeId() async {
      final response = await http.post(
        Uri.parse("${Env.URL_PREFIX}/showroom/like/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({}),
      );
      // print ("post response code: ${response.statusCode}  body: ${response.body}");
      if (response.statusCode == 201) {
        String likeId = likeFromJson(response.body).id!;
        await setLikeIdPref(likeId);
        return;
      }
      throw Exception("failed to load like");
  }

  static Future<void> addLikedPost(int postId) async{
    final likeId = await getLikeId();
    final response = await http.post(Uri.parse("${Env.URL_PREFIX}/showroom/like/$likeId/likes/"),
      headers: {"Content-Type":'application/json',},
      body: json.encode({'vehicle_id':postId,}),);
   // print("add like response body: ${response.body} ");
   // print("code: ${response.statusCode}");
    if(response.statusCode == 201){ return; }
    throw Exception("failed to load like");
  }

 static Future<Like> getLikedPosts() async{
  if(await getLikeId() == null){
    await createLikeId();
  }
  // print ("like id : ${await getLikeId()}");
   final response = await http.get(Uri.parse("${Env.URL_PREFIX}/showroom/like/${await getLikeId()}/"));
  //  print("get id response ${response.body}");
   if(response.statusCode==200 ){
     return likeFromJson(response.body);
   }
   else if(!response.body.contains("[]")){
     print("there is no liked post") ;
   }
   throw Exception("failed to load liked post");
 }

}