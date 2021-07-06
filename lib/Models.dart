
import 'package:flutter/material.dart';

List<ItemModel> listItemsDeportes = List<ItemModel>.generate(50,(i) => new ItemModel("Deporte ${i+1}", false));
List<ItemModel> listItemsInteres = List<ItemModel>.generate(50,(i) => new ItemModel("Interes ${i+1}", false));
List<ItemModel> listItemsOtro = List<ItemModel>.generate(50,(i) => new ItemModel("Otro ${i+1}", false));
List<ItemModel> listItemsAlimentos = List<ItemModel>.generate(50,(i) => new ItemModel("Alimentos ${i+1}", false));
List<ItemModel> listItemsBebidas = List<ItemModel>.generate(50,(i) => new ItemModel("Bbebidas ${i+1}", false));

class CustomTabModel{
  CustomTabModel(this.title, this.widget);
  String title;
  Widget widget;
}

class TabModel{
  TabModel(this.title, this.listItems);
  String title;
  List<ItemModel> listItems;
}

class ItemModel{
  ItemModel(this.title, this.isActive);
  String title;
  bool isActive;

  setActive(bool active){
    this.isActive = active;
  }
}