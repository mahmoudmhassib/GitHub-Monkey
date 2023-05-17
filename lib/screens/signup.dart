import 'package:flutter/material.dart';
import 'package:monekyapp/screens/pageview.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
                  child: Text('Sign Up',style: TextStyle(fontSize:30 ,color: Color(0xFF4A4B4D),fontWeight: FontWeight.normal),)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36),
              child: SizedBox(
                  width: 168,
                  height: 19,
                  child: Text('Add your details to sign up',style: TextStyle(fontSize:14 ,color: Color(0xFF7C7D7E),fontWeight: FontWeight.normal),)),
            ),
            buildSizedBox('Name'),
            buildSizedBox('Email'),
            buildSizedBox('Mobile No'),
            buildSizedBox('Password'),
            buildSizedBox('Confirm Password'),
            GestureDetector(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PageViews()));},
              child: Container(
                width: 307,
                height:56 ,
                decoration: BoxDecoration(
                  color: Color(0xFFFC6011),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text('Sign Up',style: TextStyle(fontSize:16 ,color: Colors.white,fontWeight: FontWeight.w200),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: SizedBox(
                width: 200,
                height: 20,
                child:Row(
                  children: [
                    Text('Already have an Account?',style: TextStyle(fontSize:14 ,color: Color(0xFF7C7D7E))),
                    GestureDetector(
                        onTap: (){Navigator.of(context).pop();},
                        child: Text('Login',style: TextStyle(fontSize: 14,color: Color(0xFFFC6011),fontWeight: FontWeight.bold))),
                  ],
                )
              ),
            ),
          ],
        ),
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
