import 'package:flutter/material.dart';
import 'package:monekyapp/screens/login.dart';
import 'package:monekyapp/screens/signup.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

import '../tabscreen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*logPref()async{
    SecureSharedPref pref=await SecureSharedPref.getInstance();

    //await pref.putBool('login', true ,isEncrypted: true);
    print("rrrrrrrrrrrrrrrrrrrrr");
    print(await pref.getBool('login'));
    bool? check = await pref.getBool('login');
    if(check!){
      Navigator.push(context, MaterialPageRoute(builder: (context) => TabScreens()));
    }

  }
  @override
  void initState() {
    logPref();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                color: Color(0xFFFC6011),
                child: Image.asset(
                  'lib/images/login/Background objects.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 230,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Stack(children: [
                    Center(
                      child: Image.asset('lib/images/login/Group 873.png'),
                    ),
                    Positioned(
                      left: 0,
                        right: 0,
                        bottom: 65,
                        child: Center(
                            child:
                                Image.asset('lib/images/login/Path 2745.png',))),
                  ]),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Meal',style: TextStyle(fontSize: 34,color: Color(0xFFFC6011),fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Monkey',style: TextStyle(fontSize: 34,color: Color(0xFF4A4B4D),fontWeight: FontWeight.bold)),
                  ]
                ),),
            ),
            Text('FOOD DELEVIRY',style: TextStyle(letterSpacing: 2,color: Color(0xFF4A4B4D),fontSize: 10,fontFamily: 'lib/fonts/Roboto-Regular.ttf'),),
            Padding(
              padding: const EdgeInsets.only(top: 44,bottom: 1),
              child: SizedBox(
                width:275 ,
                  height:50 ,
                  child: Text('    Discover the best food from over 1,000\nrestaurant and fast delivery to your doorstep',style: TextStyle(fontSize:13 ,color: Color(0xFF7C7D7E)),)),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LogIn()));
                },
              child: Container(
                width: 310,
                height:60 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFC6011),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text('Login',style: TextStyle(fontSize:16 ,color: Colors.white,fontWeight: FontWeight.w200),),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 310,
              height:60 ,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFC6011)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text('Create an Account ',style: TextStyle(fontSize:16 ,color: Color(0xFFFC6011),fontWeight: FontWeight.w200),),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
