import 'package:aryanwheels_flutter/providers/like_provider.dart';

import './pages/like.dart';
import './providers/seller_profile_provider.dart';
import './providers/vehicles_provider.dart';
import 'package:provider/provider.dart';
import './pages/add_post.dart' ;
import './pages/home.dart';
import './pages/login.dart';
import './pages/seller_profile.dart';
import './pages/search.dart';
import './pages/signup.dart';
import './responsive/mobile_screen_layout.dart';
import './responsive/responsive_layout.dart';
import './responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (_)=>VehiclesProvider()),
        ChangeNotifierProvider(
        create: (_)=>SellerProfileProvider()),
      ChangeNotifierProvider(
          create: (_)=>LikeProvider()),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aryanwheels',
        initialRoute: '/',

        routes:<String,WidgetBuilder> {
            '/':
                (context) =>
            const ResponsiveLayout(mobileScreenLayout: MobileScreen(),
                webScreenLayout: WebScreenLayout()),
            '/home':
                (context) => Home(),
            '/search':
                (context) => const Search(),
            '/favorite':
                (context) =>  Like(),
            '/profile':
                (context) => const SellerProfile(),
            '/login':
                (context) => Login(),
            '/signup':
                (context) => Signup(),
            '/add_post':
                (context) => const AddPost(),
          },
      ),
    );
  }
}
