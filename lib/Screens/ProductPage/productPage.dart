import 'package:flutter/material.dart';
import 'package:intern_food/Providers/currentState.dart';
import 'package:intern_food/Screens/Home/widgets/plateWidget.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  String image;

  ProductPage({this.image});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool anySalad = false;

  bool anySoup = false;

  @override
  Widget build(BuildContext context) {

    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                    )
                  ],
                ),
              ),
            ),
            Consumer<CurrentState>(
              builder: (context, _, __) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductPage(
                                  image: _instance.nameD,
                                )));
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          anySoup == true || anySalad == true ? "Skip" : "Next",
                          style: _instance.enableButton == true
                              ? TextStyle(color: Colors.blueGrey, fontSize: 22)
                              : TextStyle(
                                  color: Colors.blueGrey.withOpacity(0.5),
                                  fontSize: 22),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: _instance.enableButton == true
                              ? Colors.blueGrey
                              : Colors.blueGrey.withOpacity(0.5),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
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
                      colors: [Colors.redAccent, Colors.yellow]),
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
                        'Select the side(s) you \n prefer with Dinner',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //width: 300,
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(
                  top: 120,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                  //child: ,
                ),
              ),
              Positioned(
                top: 130,
                right: 10,
                left: 10,
                child: Container(
                  //width: 200,
                  child: Container(
                    //color: Colors.red,
                    height: 280,
                    width: 280,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 40,
                          right: 90,
                          //left: 10,
                          //top: 10,
                          child: Container(
                            height: 170,
                            width: 170,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ]),
                          ),
                        ),
                        // Positioned(
                        //   left: 15,
                        //   right: 15,
                        //   top: 15,
                        //   bottom: 15,
                        //   child: Container(
                        //     height: 140,
                        //     width: 140,
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(200),
                        //     ),
                        //   ),
                        // ),
                        Center(
                          child: Hero(
                            tag: _instance.nameD,
                            child: Container(
                              height: 250,
                              width: 250,
                              child:
                                  Image.asset("assets/${_instance.nameD}.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                //width: 300,
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(
                  //bottom: 120,
                  top: size.height / 2 + 50,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "Sides",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  transform: anySalad
                                      ? (Matrix4.translationValues(
                                      4,
                                      -(size.height * 0.23),
                                      0)
                                    ..scale(0.9))
                                      : Matrix4.translationValues(
                                      0, 0, 0)
                                    ..scale(0.9),
                                  child: Image.asset(
                                      'assets/Salad.png')),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 500),

                                transform: anySoup
                                    ? (Matrix4.translationValues(
                                    size.width * 0.1,
                                    -(size.height * 0.50),
                                    0)
                                  ..scale(0.9))
                                    : Matrix4.translationValues(
                                    0, 0, 0)
                                  ..scale(0.99),
                                child:
                                Image.asset('assets/Soup.png'),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        anySalad = !anySalad;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(200),
                                          boxShadow: [
                                            BoxShadow(
                                              color: anySalad == false
                                                  ? Colors.black.withOpacity(0)
                                                  : Colors.orange.withOpacity(0.9),
                                              spreadRadius: 0,
                                              blurRadius: 7,
                                              offset: Offset(0, 1), // changes position of shadow
                                            ),
                                          ]
                                      ),
                                      child: Image.asset(
                                          'assets/Salad.png'),
                                    ),
                                  ),
                                  Text("Any Salad",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 24)),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        anySoup = !anySoup;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(200),
                                        boxShadow: [
                                          BoxShadow(
                                            color: anySoup == false
                                                ? Colors.black.withOpacity(0)
                                                : Colors.orange.withOpacity(0.9),
                                            spreadRadius: 0,
                                            blurRadius: 7,
                                            offset: Offset(0, 1), // changes position of shadow
                                          ),
                                        ]
                                      ),
                                      child: Image.asset(
                                          'assets/Soup.png'),
                                    ),
                                  ),
                                  Text(
                                    "Any Soup",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 24),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 40,)
                    ],
                  )

                ],
              ),

              // AnimatedPositioned(
              //   top: 120,
              //   right: 0,
              //   child: AnimatedContainer(
              //
              //       duration: Duration(seconds: 1),
              //       child: Image.asset(
              //         "assets/Soup.png",
              //         //width: 100,
              //       )),
              //   duration: Duration(seconds: 1),
              // ),
              //
              // // these are the final values where the animated dishes need to be at
              // AnimatedPositioned(
              //   bottom: 300,
              //   left: 10,
              //   child: AnimatedContainer(
              //
              //       duration: Duration(seconds: 1),
              //       child: Image.asset(
              //         "assets/Salad.png",
              //         //width: 100,
              //       )),
              //   duration: Duration(seconds: 1),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
