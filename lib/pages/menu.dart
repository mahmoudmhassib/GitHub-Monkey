
import 'package:flutter/material.dart';
import 'package:monekyapp/tabscreen.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';



import '../screens/dessert.dart';

class Menu extends StatefulWidget {

  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: SafeArea(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(left: 12.0,right: 12,top: 15),
               child: SizedBox(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:const [
                     Text("Menu",style: TextStyle(fontSize: 25,color: Colors.grey),),
                     Icon(Icons.shopping_cart,size: 28,),
                   ],
                 ),
               ),
             ),
             SizedBox(
               height: 95,
               width: 333,
               child: Padding(
                 padding: const EdgeInsets.only( top:24 ,bottom:30 ),
                 child: TextField(
                   decoration: InputDecoration(
                     filled: true,
                     fillColor: Color(0xFFF2F2F2),
                     hintText: 'Search food',
                     hintStyle: TextStyle(fontSize: 14,fontFamily: 'lib/fonts/Roboto-Regular.ttf',color: Color(0xFFB6B7B7)),
                     prefixIcon: Icon(Icons.search),
                     enabled: true,
                     border: OutlineInputBorder(
                       borderRadius:BorderRadius.circular(30) ,
                       borderSide: BorderSide.none,
                     )
                   ),
                 ),
               ),
             ),
             Stack(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 8),
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Container(
                       height: 430,
                       width: 97,
                       decoration:const BoxDecoration(
                         color: Color(0xFFFC6011),
                         borderRadius: BorderRadius.only(topRight:Radius.circular(45) ,bottomRight: Radius.circular(45))
                       ),
                     ),
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      buildSizedBox('Food','120 Items','lib/images/menu/allison-griffith-VCXk_bO97VQ-unsplash.png', (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DessertScreen(title: "Food", menuType: 'food',)));}),
                      buildSizedBox('Beverages','220 Items','lib/images/menu/davide-cantelli-jpkfc5_d-DI-unsplash.png', (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DessertScreen(title: "Beverages", menuType: 'beverages',)));}),
                      buildSizedBox('Desserts','155 Items','lib/images/menu/Mask Group 2189.png', (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DessertScreen(title: "Desserts", menuType: 'desserts',)));}),
                      buildSizedBox('Promotions','25 Items','lib/images/menu/Mask Group 2190.png', (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DessertScreen(title: "Promotions", menuType: 'promotions',)));}),
                    ],
                  ),
                )

               ],
             ),
           ],
         ),
       ),
    );
  }

  Padding buildSizedBox(String type,String item,String img, Function() onClick) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: SizedBox(
        height: 88,
        child: Stack(
                      children: [
                        Positioned(
                          right: 30,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width:MediaQuery.of(context).size.width * 0.77 ,
                            decoration:const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(0,2),spreadRadius: 3),
                                ],
                                borderRadius: BorderRadius.only(topRight:Radius.circular(10) ,bottomRight:Radius.circular(10) ,topLeft:Radius.circular(30) ,bottomLeft: Radius.circular(30))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 56,top: 15,bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(type,style: TextStyle(fontSize: 22,color: Color(0xFF4A4B4D),fontWeight: FontWeight.bold),),
                                 const SizedBox(height: 5),
                                  Text(item,style: TextStyle(fontSize: 11,color: Color(0xFFB6B7B7),fontFamily: 'lib/fonts/Roboto-Regular.ttf'),),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //TODO: add function to it
                        Positioned(
                          right: 15,
                          top: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: onClick,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration:const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,blurRadius: 10,offset: Offset(0,2),spreadRadius: 3),
                                ],

                              ),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios_outlined,color:Color(0xFFFC6011),size: 15,),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                            left: 30,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(img),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                        ),
                      ],
                    ),),
    );
  }
}
