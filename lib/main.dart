import 'package:flutter/material.dart';
import 'package:intern_food/Providers/currentState.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/homePage.dart';
import 'Screens/Home/mainHome.dart';
import 'Screens/ProductPage/productPage.dart';



void main()=> {
  runApp(MyInitialApp())
};



class MyInitialApp extends StatefulWidget {
  //const MyInitialApp({Key? key}) : super(key: key);

  @override
  _MyInitialAppState createState() => _MyInitialAppState();
}

class _MyInitialAppState extends State<MyInitialApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CurrentState())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserHomeScreen(),
      ),
    );
  }
}
