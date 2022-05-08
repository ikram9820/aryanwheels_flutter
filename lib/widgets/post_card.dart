import '../util/mobile_text_size.dart';
import '../models/seller_profile_model.dart';
import 'package:provider/provider.dart';
import './profile.dart';
import '../providers/seller_profile_provider.dart';
import '../models/vehicles_model.dart';
import './like_button.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Vehicle vehicle;
  const PostCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // post details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //profile pic
                GestureDetector(
                  onTap: () async{
                    SellerProfileProvider spp =
                        Provider.of<SellerProfileProvider>(context,listen: false);
                    SellerProfileModel seller = await spp.getSellerProfileModel(vehicle.ownerId!);
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => Profile(seller: seller)));
                  },

                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                vehicle.owner.toString().trim(),
                                style: const TextStyle(
                                  fontSize: bodyTxt,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Text(
                              vehicle.postingDate.toString(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: smallestTxt,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                PopupMenuButton(
                        itemBuilder: (_) => [
                            const PopupMenuItem(child: Text('edit')),
                            const PopupMenuItem(child: Text('delete')),
                            ]),

              ],
            ),
          ),


          //vehicle title
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
            child: Text(
              '${vehicle.manufacturer} ${vehicle.model} ${vehicle.modelYear}',
              style: const TextStyle(
                  fontSize: smallestTxt,
                  fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          //distance traveled
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
            child: Text(
              (vehicle.distanceTraveled == 0 || vehicle.distanceTraveled == null )
                  ? 'new'
                  : vehicle.distanceTraveled.toString() + ' km',
              style: const TextStyle(
                fontSize: smallestTxt,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          //price
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 1, 10, 0),
            child: Text(
              "price: "+vehicle.price.toString(),
              style: const TextStyle(
                fontSize: smallestTxt,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),

          //description
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Text(
              vehicle.description.toString(),
              style: const TextStyle(fontSize: detailsTxt),
            ),
          ),
          // picture
          if(vehicle.images!=null)
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[300], shape: BoxShape.rectangle),

            ),
          //list of pictures

          // if(vehicle.images!=null && vehicle.images!.length>1)
          // ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: vehicle.images?.length,
          //     itemBuilder: (BuildContext context,int index){
          //       print('$index: ${vehicle.images?.length}');
          //   return Container(
          //     height: 80,
          //     width: 80,
          //     decoration: BoxDecoration(
          //         color: Colors.grey[300], shape: BoxShape.rectangle),
          //
          //   );
          // }),
          // const Divider(
          //   indent: 10,
          //   endIndent: 10,
          // ),

          //post bottom
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Like(vehicleId: vehicle.id,),
                // TextButton(
                //     onPressed: () {},
                //     child: const Icon(
                //       Icons.notes,
                //     )),
                TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.whatsapp,
                      color: Colors.green,
                    )),
              ],
            ),
        ],
      ),
    );
  }
}
