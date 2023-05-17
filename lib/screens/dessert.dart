import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:monekyapp/provider/productprovider.dart';
import 'package:provider/provider.dart';
import 'itemdetails.dart';

class DessertScreen extends StatefulWidget {
  final String title;
  final String menuType;
  const DessertScreen({Key? key, required this.title, required this.menuType}) : super(key: key);

  @override
  State<DessertScreen> createState() => _DessertScreenState();
}

class _DessertScreenState extends State<DessertScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context, listen: false).getAllProds();
    });
  }
  final _bgColor =const Color(0xFFF6F6F6);
  int _pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: AwesomeBottomNav(
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
      body: SafeArea(
        child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top: 15),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(child: Row(children: [IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios)),
                          Text(widget.title,style: TextStyle(fontSize: 25,color: Color(0xFF4A4B4D)),),],),),
                        Icon(Icons.shopping_cart,size: 28,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
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
                Consumer<ProviderProduct>(
                  builder: (ctx,value,child){
                    final provider=value.products;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: provider.length,
                          itemBuilder: (ctx,index){
                            return
                              GestureDetector(
                                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ItemDetails(id: provider[index].id,)));},
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  height: 193,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(provider[index].image),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:21,bottom: 12 ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(provider[index].title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: 'lib/fonts/Roboto-Regular.ttf'),),
                                        SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Icon(Icons.star,color: Color(0xFFFC6011),),
                                            RichText(
                                                text:TextSpan(
                                                    children: [
                                                      TextSpan(text: '${provider[index].rating}',style: TextStyle(color: Color(0xFFFC6011),fontSize: 11,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                      TextSpan(text: ' Minute by tuk tuk ',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                      TextSpan(text: '    ${provider[index].menuType}',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.normal,fontFamily: 'lib/fonts/Roboto-Regular.ttf')),
                                                    ]
                                                ) ),
                                          ],),
                                      ],
                                    ),
                                  ),
                                ),
                              );


                          }),
                    );
                  },
                ),

              ],
            ) ,
        ),
      );
  }
}
