import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:monekyapp/provider/productprovider.dart';
import 'package:provider/provider.dart';


class ItemDetails extends StatefulWidget {
  int id;

  ItemDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {


  final _bgColor = const Color(0xFFF6F6F6);
  int _pageIndex = 0;
  int counter = 1;
late int totalprice;
  @override
  void increment(int price) {
    setState(() {
      counter++;
       totalprice=counter*price;
       print(price);
       print(totalprice);
    });
  }

  void decrement(int price) {
    if (counter == 1) {
      setState(() {
        counter = 1;
         totalprice=counter*price;
      });
    } else {
      setState(() {
        counter--;
         totalprice=counter*price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AwesomeBottomNav(
        icons: const [
          Icons.widgets,
          Icons.shopping_bag,
          Icons.home_outlined,
          Icons.person,
          Icons.list,
        ],
        highlightedIcons: const [
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
        bodyBgColor: _bgColor,
        highlightColor: const Color(0xFFFF9944),
        navFgColor: Colors.grey.withOpacity(0.5),
        navBgColor: Colors.white,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child:Consumer<ProviderProduct>(
            builder: (ctx,value,child){

              final provider=value.getProdById(widget.id);
              totalprice=provider.price * counter;

              return   Stack(children: [
                //TODO: Item Image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(provider.image),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12, top: 25),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              )),
                          Icon(
                            Icons.shopping_cart,
                            size: 25,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //TODO: Main Item Details
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.58,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 29, right: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              provider.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xFF4A4B4D)),
                            ),
                          ),
                          SizedBox(height: 3),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFEE5A30),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFEE5A30),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFEE5A30),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFFEE5A30),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Icon(
                                            Icons.star_border,
                                            color: Color(0xFFEE5A30),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      '${provider.rating} Star Rating',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFFEE5A30),
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 35,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '\$${provider.price}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4A4B4D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 22, top: 29, bottom: 10),
                            child: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4A4B4D),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22),
                            child: Text(
                              provider.details,
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF7C7D7E)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 22, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Number of Items',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4A4B4D),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 156,
                                  child: Row(
                                    children: [
                                      buildContainerPlus(Icons.remove, (){decrement(provider.price);}),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Container(
                                        width: 50,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Color(0xFFFC6011))),
                                        child: Center(
                                          child: Text(
                                            '${counter}',
                                            style:
                                            TextStyle(color: Color(0xFFFC6011)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      buildContainerPlus(Icons.add,(){increment(provider.price);} ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .18,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 97,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFC6011),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(50),
                                            bottomRight: Radius.circular(50))),
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  top: 13,
                                  child: Container(
                                    width: 277,
                                    height: 122,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 2),
                                              spreadRadius: 1,
                                              blurRadius: 3),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            bottomLeft: Radius.circular(50))),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Price',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF4A4B4D)),
                                        ),
                                        Text(
                                          '\$${totalprice}',
                                          style: TextStyle(
                                              fontSize: 21,
                                              color: Color(0xFF4A4B4D),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 157,
                                          height: 29,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFFC6011),
                                              borderRadius:
                                              BorderRadius.circular(50)),
                                          child: Center(
                                            child: Text(
                                              'Add To Cart',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 1,
                                            offset: Offset(0, 1),
                                            blurRadius: 2,
                                          )
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Color(0xFFFC6011),
                                        size: 21,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
            },
          ),
      ),
    );
  }

  Container buildContainerPlus(IconData iconButton, Function() function) {
    return    Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFFC6011),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: IconButton(
                onPressed: function,
                icon: Icon(
                  iconButton,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          );
  }
}
