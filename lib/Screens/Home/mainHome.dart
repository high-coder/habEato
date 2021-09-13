import 'package:flutter/material.dart';
import 'package:intern_food/Providers/currentState.dart';
import 'package:intern_food/Screens/Home/homePage.dart';
import 'package:provider/provider.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.redAccent, Colors.yellow]
                  ),
                ),
                child: Container(
                  width: size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.redAccent, Colors.yellow]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'How does your Dinner \n look like?',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "(excluding salad, curd and sides)",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text("Select any 1 or more plates",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              // Container(
              //   //color: Colors.red,
              //   child: HomePage()
              // ),
              Container(
                margin: EdgeInsets.only(top: 130,),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                    child: HomePage()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
