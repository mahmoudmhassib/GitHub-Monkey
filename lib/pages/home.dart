import 'package:flutter/material.dart';
import 'package:monekyapp/provider/productprovider.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context, listen: false).getFoodTypes();
      Provider.of<ProviderProduct>(context, listen: false).getAllProds();
      Provider.of<ProviderProduct>(context, listen: false).getAlloffers();
    }

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12,top: 15),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Text("Good Morning Mahmoud",style: TextStyle(fontSize: 20,color: Color(0xFF4A4B4D),fontWeight: FontWeight.normal),),
                      Icon(Icons.shopping_cart,size: 28,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,top:18 ,bottom: 3),
                child: Text('Delivering to',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf',color: Color(0xFFB6B7B7))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text('Current Location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,fontFamily: 'lib/fonts/Roboto-Regular.ttf',color: Color(0xFF7C7D7E)),),
                    SizedBox(width: 20),
                  Icon(Icons.expand_more_rounded,color: Color(0xFFFC6011),size: 25,),
                  ],
                ),
              ),
              SizedBox(
                height: 95,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.only(right:21,left:21,top:24 ,bottom:30 ),
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
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: SizedBox(
                  width: double.infinity,
                  height:113 ,
                  child: Consumer<ProviderProduct>(
                    builder: (ctx,value,child){
                      final prov=value.foodTypes;
                      return   ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: prov.length ,
                          itemBuilder: (ctx,index){
                            return   Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 9,left: 9),
                                  width: 88,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(prov[index].image),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(prov[index].title,style: TextStyle(color: Color(0xFF4A4B4D),fontSize: 14,fontWeight: FontWeight.bold),),
                              ],
                            ) ;
                          }) ;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17,right: 21,top: 60,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Restaurents',style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.w500,fontSize:20 ),),
                    Text('View all',style: TextStyle(color: Color(0xFFFC6011),fontWeight: FontWeight.normal,fontSize:13 ),),
                  ],
                ),
              ),
              Consumer<ProviderProduct>(
                builder: (ctx,value,child){
                  final provid=value.products;
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildContainer(provid[0].image),
                      buildPaddingType(provid[0].title),
                      buildPaddingText(provid[0].rating,' Minute by tuk tuk ','     ${provid[0].menuType}'),
                      buildContainer(provid[1].image),
                      buildPaddingType(provid[1].title),
                      buildPaddingText(provid[1].rating,' Minute by tuk tuk ','     ${provid[1].menuType}'),
                      buildContainer(provid[2].image),
                      buildPaddingType(provid[2].title),
                      buildPaddingText(provid[2].rating,' Minute by tuk tuk ','     ${provid[2].menuType}'),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17,right: 21,top: 40,bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('More Popular',style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.w500,fontSize:20 ),),
                    Text('View all',style: TextStyle(color: Color(0xFFFC6011),fontWeight: FontWeight.normal,fontSize:13 ),),
                  ],
                ),
              ),
              SizedBox(
                width:double.infinity,
                height: 180,
                child:Consumer<ProviderProduct>(

                  builder: (ctx,value,child){
                    final proov=value.products;
                    return   ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (ctx,index){
                          return  Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: SizedBox(
                              height: 180,
                              width: 215,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 105,
                                    width:215 ,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: NetworkImage(proov[index].image),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(proov[index].title,style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star,color: Color(0xFFFC6011),),
                                        RichText(
                                            text:TextSpan(
                                                children: [
                                                  TextSpan(text: ' ${proov[index].rating}',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                  TextSpan(text: ' Minute by tuk tuk ',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                  TextSpan(text: '       ${proov[index].menuType}',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                ]
                                            ) ),
                                      ],),
                                  ),
                                ],
                              ),
                            ),
                          ) ;
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17,right: 21,top: 20,bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Recent Item',style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.w500,fontSize:20 ),),
                    Text('View all',style: TextStyle(color: Color(0xFFFC6011),fontWeight: FontWeight.normal,fontSize:13 ),),
                  ],
                ),
              ),
              Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 13),
                    child:
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .91,
                          height: 85,
                          child: Row(
                            children: [
                              Consumer<ProviderProduct>(
                                builder: (ctx,value,child){
                                  final prov=value.foodTypes;
                                  return   Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(prov[0].image),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  );
                                },
                              ),
                             Consumer<ProviderProduct>(
                               builder: (ctx,value,child){
                                 final provid=value.products;
                                 return  Padding(
                                   padding: const EdgeInsets.only(left: 22,bottom: 5),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(provid[1].title,style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.bold,fontSize: 18),),
                                       RichText(
                                         text: TextSpan(
                                           children: [
                                             TextSpan(text: '${provid[1].menuType}  ',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                             TextSpan(text: 'western food',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                           ],),),
                                       Row(
                                         children: [
                                           Icon(Icons.star,color: Color(0xFFFC6011),size: 15,),
                                           RichText(
                                             text: TextSpan(
                                               children: [
                                                 TextSpan(text: ' ${provid[1].rating}  ',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                 TextSpan(text: ' (124 Rating)',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                               ],),),
                                         ],
                                       ),

                                     ],
                                   ),
                                 );
                               },
                             ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .91,
                          height: 85,
                          child: Row(
                            children: [
                              Consumer<ProviderProduct>(
                                builder: (ctx,value,child){
                                  final provid=value.foodTypes;
                                  return Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(provid[1].image),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  );
                                },
                              ),
                              Consumer<ProviderProduct>(
                                builder: (ctx,value,child){
                                  final provid=value.products;
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 22,bottom: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(provid[2].title,style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.bold,fontSize: 18),),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text: '${provid[2].menuType}  ',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                              TextSpan(text: 'western food',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                            ],),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Color(0xFFFC6011),size: 15,),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(text: ' ${provid[2].rating}  ',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                  TextSpan(text: ' (124 Rating)',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                ],),),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .91,
                          height: 85,
                          child: Row(
                            children: [
                              Consumer<ProviderProduct>(
                                builder: (ctx,value,child){
                                  final provid=value.foodTypes;
                                  return  Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(provid[2].image),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  );
                                },
                              ),
                              Consumer<ProviderProduct>(
                                builder: (ctx,value,child){
                                  final provid=value.products;
                                  return  Padding(
                                    padding: const EdgeInsets.only(left: 22,bottom: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(provid[3].title,style: TextStyle(color: Color(0xFF4A4B4D),fontWeight: FontWeight.bold,fontSize: 18),),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text: '${provid[3].menuType}  ',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                              TextSpan(text: 'western food',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                            ],),),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Color(0xFFFC6011),size: 15,),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(text: ' ${provid[3].rating}  ',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                  TextSpan(text: ' (124 Rating)',style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 11,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                ],),),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) ,

            ],
          ),
        ),
      ),
    );
  }

  Padding buildPaddingText(num rate,String name,String type) {
    return Padding(
                        padding: const EdgeInsets.only(left: 21,bottom: 20),
                        child: Row(
                          children: [
                            Icon(Icons.star,color: Color(0xFFFC6011),),
                            RichText(
                                text:TextSpan(
                                    children: [
                                      TextSpan(text: '${rate}',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                      TextSpan(text:name ,style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                      TextSpan(text:type ,style: TextStyle(color: Color(0xFFB6B7B7),fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                    ]
                                ) ),
                          ],),
                      );
  }

  Padding buildPaddingType(String type) {
    return Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 21),
                        child: Text(type,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                      );
  }

  Container buildContainer(String img) {
    return Container(
                        height: 195,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.fill,
                            )
                        ),
                      );
  }
}

