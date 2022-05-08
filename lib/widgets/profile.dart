import '../util/colors.dart';
import '../util/mobile_text_size.dart';
import './post_card.dart';
import '../models/seller_profile_model.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final SellerProfileModel seller;
  final bool isAuthSeller;
  const Profile({required this.seller,this.isAuthSeller=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        centerTitle: true,
        title:  Text(
          seller.user.toString(),
          style: const TextStyle(
            fontSize: titleTxt,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[300]),
                    ),
                  ),
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  seller.postCount.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Posts'),
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  seller.followers.toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Followers'),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: isAuthSeller
                             ?TextButton(
                              onPressed: null,
                              child: const Text(
                                'Edit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.blue)),
                            )
                             :TextButton(
                              onPressed: null,
                              child: const Text(
                                'Follow',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.green)),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                seller.user.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text('${seller.city} ${seller.address}'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
              child: Text(seller.whatsappContact.toString()),
            ),

            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: seller.postCount,
                itemBuilder: (context, index) {

                  return (seller.vehicles ==null )?const Text('this user did not post any vehicle yet')
                      : PostCard(vehicle: seller.vehicles![index]);
                }),
          ],
        ),
      ),
    );
  }
}
