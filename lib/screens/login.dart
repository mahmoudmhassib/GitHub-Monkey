import 'package:flutter/material.dart';
import 'package:monekyapp/screens/signup.dart';

import 'homescreen.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Padding(
        padding: const EdgeInsets.only(top: 60,bottom: 12),
        child: SizedBox(
            width: 120,
            height: 40,
            child: Text('Login',style: TextStyle(fontSize:30 ,color: Color(0xFF4A4B4D),fontWeight: FontWeight.normal),)),
      ),
        Padding(
          padding: const EdgeInsets.only(bottom: 36),
          child: SizedBox(
              width: 168,
              height: 19,
              child: Text('Add your details to Login',style: TextStyle(fontSize:14 ,color: Color(0xFF7C7D7E),fontWeight: FontWeight.normal),)),
        ),
        buildSizedBox('Your Email'),
        buildSizedBox('Password'),
      GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));},
        child: Container(
          width: 307,
          height:56 ,
          decoration: BoxDecoration(
            color: Color(0xFFFC6011),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text('Login',style: TextStyle(fontSize:16 ,color: Colors.white,fontWeight: FontWeight.w200),),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 24),
          child: SizedBox(
              width: 215,
              height: 20,
              child:Row(
                children: [
                  Text('Already have an Account?',style: TextStyle(fontSize:14 ,color: Color(0xFF7C7D7E))),
                  GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignUp()));},
                      child: Text('Sign Up',style: TextStyle(fontSize: 14,color: Color(0xFFFC6011),fontWeight: FontWeight.bold))),
                ],
              )
          ),
      ),
  ]),
    ),
    );
  }
  Padding buildSizedBox(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom:14 ),
      child: SizedBox(
        width:307 ,
        height: 56,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 35),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14,color: Color(0xFFB6B7B7),fontFamily: 'lib/fonts/Roboto-Regular.ttf'),
              filled: true,
              fillColor: Color(0xFFF2F2F2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              )
          ),
        ),
      ),
    );
  }
}
