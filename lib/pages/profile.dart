import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Color _color=const Color(0xFFFC6011);
  final Color _color1=const Color(0xFF4A4B4D);
  final Color _color2=const Color(0xFF7C7D7E);
  final Color _color3=const Color(0xFFB6B7B7);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 15),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Text("Profile",style: TextStyle(fontSize: 25,color: Colors.grey),),
                        Icon(Icons.shopping_cart,size: 28,),
                      ],
                    ),
                  ),
                ),
               const  Padding(
                   padding:  EdgeInsets.only(top: 15,bottom: 10),
                   child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('lib/images/profileimage/NoPath - Copy (14).png'),
                ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.edit,color: _color,size: 20,),
                    const SizedBox(width: 5),
                    Text('Edit Profile',style: TextStyle(color: _color),)
                  ],
                ),
               const SizedBox(height: 10),
                Text('Hi there Emilia!',style: TextStyle(fontSize: 20,color:_color1,fontWeight: FontWeight.bold,fontFamily: 'lib/fonts/Roboto-Black.ttf'),),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text('Sign Out',style: TextStyle(fontSize: 18,color: _color2,fontFamily:'lib/fonts/Roboto-Black.ttf' ),),
                ),
                 buildContainerTextField('Name'),
                 buildContainerTextField('Email'),
                 buildContainerTextField('Mobile No'),
                 buildContainerTextField('Password'),
                 buildContainerTextField('Confirm Password'),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25),
                    width: 307,
                    height:50 ,
                    decoration: BoxDecoration(
                      color: Color(0xFFFC6011),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text('Sign Up',style: TextStyle(fontSize:16 ,color: Colors.white,fontWeight: FontWeight.w200),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Padding buildContainerTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8 ),
      child: SizedBox(
        width:307 ,
        height: 56,
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 35),
              labelText: label,
              labelStyle: TextStyle(fontSize: 14,color: Color(0xFFB6B7B7),fontFamily: 'lib/fonts/Roboto-Regular.ttf'),
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
