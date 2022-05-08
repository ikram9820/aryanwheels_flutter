import 'package:aryanwheels_flutter/providers/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Like extends StatelessWidget{

  Like({Key? key, required this.vehicleId}) : super(key: key);
  final vehicleId;
  @override
  Widget build(BuildContext context) {
    return Consumer<LikeProvider>(
      builder:(_,likeProvider,child)=> IconButton(
            onPressed: ()async {
            await likeProvider.addLike(vehicleId);
            print('this is liked vehicle ids'+likeProvider.isLiked.toString());

            },
            icon: likeProvider.isLiked.contains(vehicleId)?
            const Icon(Icons.favorite,color: Colors.redAccent,)
            :const Icon(Icons.favorite_border_sharp,color: Colors.redAccent,),
      ),
    );
  }
}
