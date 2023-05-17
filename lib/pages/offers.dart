import 'package:flutter/material.dart';
import 'package:monekyapp/provider/productprovider.dart';
import 'package:provider/provider.dart';

import '../screens/itemdetails.dart';
class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12,top: 15),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Text("Latest Offers",style: TextStyle(fontSize: 24,color: Color(0xFF4A4B4D),fontWeight: FontWeight.normal),),
                      Icon(Icons.shopping_cart,size: 28,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16,left: 12,bottom: 11),
                child: Text('Find discounts, offers special',style: TextStyle(fontSize: 14,color: Color(0xFF7C7D7E)),),
              ),
              Container(
                margin: EdgeInsets.only(left: 12,bottom: 11,top: 11),
                width: 129,
                height: 29,
                decoration: BoxDecoration(
                  color: Color(0xFFFC6011),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(child: Text('Check Offers',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),)),
              ),

              Expanded(
                child: Consumer<ProviderProduct>(
                  builder: (ctx,value,child){
                    final provid=value.offers;
                    return ListView.builder(
                        itemCount: provid.length,
                        itemBuilder: (ctx,index){
                          return  Padding(
                            padding: const EdgeInsets.only(top: 5,left: 12,right: 12,bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(id:provid[index].id ,)));
                                  },
                                  child: Container(

                                    margin: EdgeInsets.only(top: 5,bottom: 5),
                                    width: double.infinity,
                                    height:190 ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(provid[index].image),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 21),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(provid[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                      SizedBox(child: Row(children: [
                                        Text('\$${provid[index].oldPrice}',style: TextStyle(fontSize: 20,color: Colors.black,decoration: TextDecoration.lineThrough),),
                                        SizedBox(width: 20,),
                                        Text('\$${provid[index].price}',style: TextStyle(fontSize: 20,color: Color(0xFFFC6011)),),
                                      ],),),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 21),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,color: Color(0xFFFC6011),),
                                      RichText(
                                        text:TextSpan(
                                            children: [
                                              TextSpan(text: '${provid[index].rating}',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                              TextSpan(text: ' Minute by tuk tuk ',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                              TextSpan(text:'    ${provid[index].menuType}',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                            ]
                                        ),
                                      ),
                                    ],),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              )

            ],
          ),
        ),
    );
  }
}
