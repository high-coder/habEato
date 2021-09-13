
import 'package:flutter/cupertino.dart';
import 'package:intern_food/Models/plateModel.dart';
import 'package:provider/provider.dart';

class CurrentState extends ChangeNotifier{

  bool enableButton = false;

  List<PlateModel> plates = [
    PlateModel(name: "Curry_Rice",selected: false),
    PlateModel(name: "Curry_Roti_Rice",selected: false),
    PlateModel(name: "Dal_Rice",selected: false),
    PlateModel(name: "Dal_Roti",selected: false),
    PlateModel(name: "Sabji_Dal_Rice",selected: false),
    PlateModel(name: "Sabji_Dal_Roti",selected: false),
    PlateModel(name: "Sabji_Dal_Roti_Rice",selected: false),
    PlateModel(name: "Sabji_Roti",selected: false),
  ];
  String nameD = "";
  changeSelected({String name, bool local}){
    nameD = name;

    print(name);
    plates.forEach((element) {
      if(element.name == name){
        element.selected = !local;
        print("match found");
        if(element.selected){
          enableButton = true;
        }else {
          enableButton = false;
        }
      } else {
        element.selected = false;
      }

    });
    notifyListeners();
  }

}