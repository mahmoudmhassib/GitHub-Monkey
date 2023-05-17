import 'package:flutter/material.dart';
import 'package:monekyapp/provider/productprovider.dart';
import 'package:monekyapp/splashscreen.dart';

import 'package:provider/provider.dart';

main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderProduct(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
