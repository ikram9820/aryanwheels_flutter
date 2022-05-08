import '../widgets/profile.dart';

import '../models/vehicles_model.dart';
import '../widgets/post_card.dart';
import 'package:flutter/material.dart';

class SellerProfile extends StatelessWidget {
  const SellerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("seller profile"));//Profile(seller:sellerProfCont.seller.value,isCurrentUserProfile: true);
  }
}
