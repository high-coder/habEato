import 'package:flutter/material.dart';


class PlateWidget extends StatelessWidget{

  bool selected;
  String imageName;
  bool showShadow = true;
  PlateWidget({this.selected,this.imageName,this.showShadow = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.red,
      height: 180,
      width: 180,
      child: Stack(
        children: [
          showShadow == true ? Positioned(
            bottom: 24,
            right:28,
            child: Container(
              height: size.width/3,
              width: size.width/3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      color: selected == true
                          ? Colors.black.withOpacity(0)
                          : Colors.black.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
              ),
            ),
          ) : Container(),

          Positioned(
            left: 15,
            right:15,
            top: 15,
            bottom: 15,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: [
                    BoxShadow(
                      color: selected == false
                          ? Colors.black.withOpacity(0)
                          : Colors.orange.withOpacity(0.9),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
              ),
            ),
          ),

          Center(
            child: Hero(
              tag: imageName,
              child: Container(
                height: 180,
                width: 180,

                child: Image.asset("assets/$imageName.png"),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
