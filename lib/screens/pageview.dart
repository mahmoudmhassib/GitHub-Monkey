import 'package:flutter/material.dart';
import '../tabscreen.dart';
class PageViews extends StatefulWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {



  final illustration=[
    'lib/images/pageview/Deliveryvector.png',
    'lib/images/pageview/Findfoodyoulovevector.png',
    'lib/images/pageview/Livetrackingvector.png'
  ];
  final title=[
    'Find Food Your Love',
    'Fast Delivery',
    'Live Tracking',
  ];
  final subtitle=[
    ' Discover the best food from over 1,000\n restaurant and fast delivery to your doorstep',
    'Fast food delivery to your home,office\n        whereever you are',
    'Real time tracking of your food on the app\n        once you placed the order',
  ];
  PageController _controller=PageController();
  final pageIndex=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                  controller:_controller ,
                  itemCount: illustration.length ,
                  itemBuilder: (ctx,index){
                    return PageViewBox(
                      illustration: illustration[index],
                      title: title[index],
                      subtitle: subtitle[index],
                    );
                  },
                  onPageChanged: (int index){
                    setState(() {
                      pageIndex.value=index;
                    });
                  },
                ),
            ),
            ValueListenableBuilder(
                valueListenable: pageIndex,
                builder: (ctx,index,child){
                  return Padding(
                    padding: const EdgeInsets.only(top: 16,bottom: 32),
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(illustration.length, (indexIndicator) {
                      return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                        height: 8,
                        width: indexIndicator==index?18:8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: indexIndicator==index?Color(0xFFFC6011):Colors.grey,
                        ),
                      );
                      }),
                    ),
                  );
                }
            ),
           ValueListenableBuilder(
               valueListenable: pageIndex,
               builder: (ctx,index,child){
                 if(index==illustration.length-1){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: SizedBox(
                       width: MediaQuery.of(context).size.width*.8,
                       height: 48,
                       child: ElevatedButton(
                         onPressed: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TabScreens()));
                         },

                         style: ElevatedButton.styleFrom(

                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(18),
                           ),
                           backgroundColor: Color(0xFFFC6011),
                         ),
                         child: Text('Get Start'),
                       ),
                     ),
                   );
                 }
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       TextButton(
                           onPressed: (){
                             _controller.jumpToPage(illustration.length-1);
                           },
                           child: Text('skip',style: TextStyle(fontSize: 20,color: Color(0xFFFC6011)),),),
                       ElevatedButton(

                           onPressed: (){
                             final nextPage=pageIndex.value+1;
                             _controller.animateToPage(nextPage, duration: Duration(milliseconds: 300), curve: Curves.ease);
                           },

                           child:Text('Next',style: TextStyle(color: Colors.white),
                           ) ,
                         style: ElevatedButton.styleFrom(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(16),
                           ),
                           backgroundColor: Color(0xFFFC6011),
                         ),
                       ),
                     ],
                   ),
                 );
               }
           ),
          ],
        ),
      ),
    );
  }
}

class PageViewBox extends StatefulWidget {
  final String illustration;
final String title;
final String subtitle;
   PageViewBox({Key? key,required this.illustration,required this.title,required this.subtitle}) : super(key: key);

  @override
  State<PageViewBox> createState() => _PageViewBoxState();
}

class _PageViewBoxState extends State<PageViewBox> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .55,
              child: Image.asset(widget.illustration,fit: BoxFit.fill,),
            ),
            Text(widget.title,style: TextStyle(color: Color(0xFF4A4B4D),fontSize: 28,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            const SizedBox(height: 26,),
            Text(widget.subtitle,
              style: TextStyle(fontSize:13 ,color: Color(0xFF7C7D7E)),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

