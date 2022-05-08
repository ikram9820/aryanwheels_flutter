import 'package:aryanwheels_flutter/providers/like_provider.dart';
import 'package:aryanwheels_flutter/util/mobile_text_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/vehicles_model.dart';
import '../widgets/post_card.dart';
import '../util/colors.dart';
class Like extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        centerTitle: true,
        elevation: 0,
        title: const Text('Saved',
            style: TextStyle(
              fontSize: titleTxt,
              fontWeight: FontWeight.bold,
            )),
      ),
       body:  Consumer<LikeProvider>(
         builder:(_,likeProvider,child) =>(likeProvider.like.likedPosts==null)?
         const Center(child: Text("No saved vehicle")):
         ListView.builder (
                itemCount: likeProvider.like.likedPosts?.length,
                itemBuilder: (context, index) {
                 var data = likeProvider.like.likedPosts;
                  return PostCard(vehicle: data![index].vehicle! );
                  },
     ),
       ),
    );
  }
}
