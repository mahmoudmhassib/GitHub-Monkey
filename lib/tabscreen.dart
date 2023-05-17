import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:monekyapp/pages/home.dart';
import 'package:monekyapp/pages/menu.dart';
import 'package:monekyapp/pages/more.dart';
import 'package:monekyapp/pages/offers.dart';
import 'package:monekyapp/pages/profile.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
class TabScreens extends StatefulWidget {
  const TabScreens({Key? key}) : super(key: key);

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  /*menuPref()async{
    SecureSharedPref pref=await SecureSharedPref.getInstance();
    if(await pref.getBool('login',isEncrypted: true)==true){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SignUp()));
    }

  }
  @override
  void initState() {
    menuPref();
    super.initState();
  }*/


  final _bgColor =const Color(0xFFF6F6F6);
  int _pageIndex=0;
  final List  _pages=[
    const Menu(),
    const Offers(),
    const Home(),
    const Profile(),
    const More(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_pageIndex],
      bottomNavigationBar:
      AwesomeBottomNav(
        icons:const [
          Icons.widgets,
          Icons.shopping_bag,
          Icons.home_outlined,
          Icons.person,
          Icons.list,
        ],
        highlightedIcons: const[
          Icons.widgets,
          Icons.shopping_bag,
          Icons.home_outlined,
          Icons.person,
          Icons.list,
        ],
        onTapped: (int value) {
          setState(() {
            _pageIndex = value;
          });
        },
        bodyBgColor:_bgColor ,
        highlightColor:const Color(0xFFFF9944),
        navFgColor: Colors.grey.withOpacity(0.5),
        navBgColor: Colors.white,
      ) ,
    );
  }
}
