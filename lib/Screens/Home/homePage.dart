import 'package:flutter/material.dart';
import 'package:intern_food/Providers/currentState.dart';
import 'package:intern_food/Screens/Home/widgets/plateWidget.dart';
import 'package:intern_food/Screens/ProductPage/productPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    CurrentState _instance = Provider.of<CurrentState>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        body: CustomScrollView(

          slivers: [
            // SliverAppBar(
            //   toolbarHeight: 120,
            //   pinned: true,
            //   //title: Text("thjsi s "),
            //   // title: Container(
            //   //   padding: EdgeInsets.all(0),
            //   //   margin: EdgeInsets.all(0),
            //   //   width: size.width,
            //   //   // decoration: BoxDecoration(
            //   //   //   gradient:LinearGradient(
            //   //   //     begin: Alignment.topLeft,
            //   //   //     end: Alignment.centerRight,
            //   //   //     colors: [
            //   //   //       Colors.redAccent,
            //   //   //       Colors.yellow
            //   //   //     ]
            //   //   //   ),
            //   //   // ),
            //   //   child: ,
            //   // ),
            //   flexibleSpace: FlexibleSpaceBar(
            //     titlePadding: EdgeInsets.all(0),
            //     title: Container(
            //       width: size.width,
            //       height: 250,
            //       decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.topLeft,
            //             end: Alignment.centerRight,
            //             colors: [Colors.redAccent, Colors.yellow]),
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           SizedBox(
            //             height: 20,
            //           ),
            //           Text(
            //             'How does your Dinner \n look like?',
            //             style: TextStyle(
            //                 fontSize: 25,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.black),
            //           ),
            //           Text(
            //             "(excluding salad, curd and sides)",
            //             style: TextStyle(color: Colors.black),
            //           ),
            //           Text("Select any 1 or more plates",
            //               style: TextStyle(color: Colors.black)),
            //         ],
            //       ),
            //     ),
            //   ),
            //   //backgroundColor: Colors.red,
            //   //expandedHeight: 200,
            // ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     decoration: BoxDecoration(
            //       //color: Colors.red,
            //       borderRadius: BorderRadius.only(
            //         topRight: Radius.circular(10),
            //         topLeft: Radius.circular(20),
            //       ),
            //     ),
            //     child: Column(children: [
            //       ...List.generate(
            //           _instance.plates.length,
            //           (index) => GestureDetector(
            //                 onTap: () {
            //                   _instance.changeSelected(
            //                       name: _instance.plates[index].name,
            //                       local: _instance.plates[index].selected);
            //                 },
            //                 child: Consumer<CurrentState>(
            //                   builder: (context, _, __) {
            //                     return PlateWidget(
            //                       imageName: _instance.plates[index].name,
            //                       selected: _instance.plates[index].selected,
            //                     );
            //                   },
            //                 ),
            //               ))
            //     ]),
            //   ),
            // ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        _instance.changeSelected(
                            name: _instance.plates[index].name,
                            local: _instance.plates[index].selected);
                      },
                      child: Consumer<CurrentState>(
                        builder: (context,_,__) {
                          return PlateWidget(selected: _instance.plates[index].selected, imageName: _instance.plates[index].name,);
                        },
                      )
                  );
                },
                childCount: _instance.plates.length,
                semanticIndexOffset: 2,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.arrow_back_ios_outlined, color: Colors.blueGrey,),
                    Text("Back", style: TextStyle(color: Colors.blueGrey, fontSize: 22),)
                  ],
                ),
              ),
              Consumer<CurrentState> (
                builder: (context, _,__) {
                  return GestureDetector(
                    onTap: () {

                      if(_instance.enableButton) {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProductPage(image: _instance.nameD,)));
                      }
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "Next",
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
      ),
    );
  }
}
