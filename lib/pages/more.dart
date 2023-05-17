import 'package:flutter/material.dart';
class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
            padding: const EdgeInsets.only(bottom: 15,right: 21,left: 21,top: 15),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [
                  Text("More",style: TextStyle(fontSize: 24,color: Color(0xFF4A4B4D),fontWeight: FontWeight.normal),),
                  Icon(Icons.shopping_cart,size: 25,color: Color(0xFF4A4B4D),),
                ],
              ),
            ),
          ),
              buildStack(Icons.clean_hands_outlined,'Payment Details',Icons.arrow_forward_ios),
              buildStack(Icons.shopping_bag,'My Orders',Icons.arrow_forward_ios),
              buildStack(Icons.notifications,'Notifications',Icons.arrow_forward_ios),
              buildStack(Icons.forward_to_inbox,'Inbox',Icons.arrow_forward_ios),
              buildStack(Icons.info_outline,'About Us',Icons.arrow_forward_ios),
            ],
          ),
        ),
    );
  }

  Stack buildStack(IconData iconData,String text,IconData iconData1) {
    return Stack(
              children: [
                Container(
                  margin:const EdgeInsets.only(left: 21,right: 37,top: 15,bottom:5 ),
                  width: MediaQuery.of(context).size.width*.9,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          offset: Offset(0,2),
                          spreadRadius: 3,
                      ),
                    ]
                  ),
                  child: Row(
                    children: [
                     const SizedBox(width:13 ),
                      CircleAvatar(
                        backgroundColor:const Color(0xFFD8D8D8),
                        child: Center(
                          child: Icon(iconData,color:const Color(0xFF4A4B4D),),
                        ),
                      ),
                     const SizedBox(width:19 ),
                      Text(text,style: TextStyle(fontSize: 14,color:Color(0xFF4A4B4D),fontFamily: 'lib/fonts/Roboto-Regular.ttf' ),),
                    ],
                  ),
                ),
                Positioned(
                  right: 21,
                  top: 15,
                  bottom: 15,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0,2),
                            spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(iconData1,color:const Color(0xFF7C7D7E),size: 15, ),
                    ),
                  ),
                )
              ],
            );
  }
}
