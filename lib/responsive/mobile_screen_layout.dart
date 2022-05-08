import '../pages/add_post.dart';
import '../util/colors.dart';
import '../pages/like.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/seller_profile.dart';
import '../pages/search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  _MobileScreenState createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  int _selectedInd= 0;
  static String? access = null ;
  String? refresh;
  var token;
  void _navigatePages(int ind) async{
    var token = await SharedPreferences.getInstance();
    access = token.getString('access');
    refresh= token.getString('refresh');
    print ("access :"+ access.toString());
    setState(() {
      _selectedInd = ind;

    });
  }
  final List<Widget> _pages=[
    Home(),
    const Search(),
    (access != null)?const AddPost():Login(),
    Like(),
    (access != null )? const SellerProfile(): Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedInd],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        currentIndex: _selectedInd,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _navigatePages,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:'home',activeIcon:Icon(Icons.home), ),
          BottomNavigationBarItem(icon:Icon(Icons.search),activeIcon: Icon(Icons.search),label:'search'),
          BottomNavigationBarItem(icon:Icon(Icons.add_circle_outline) ,activeIcon:Icon(Icons.add_circle),label:'sell'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),activeIcon:Icon(Icons.favorite),label:'saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline) ,activeIcon:Icon(Icons.person),label:'profile'),
        ],

      ),

    );
  }
}









