import 'package:flutter/material.dart';
import 'package:prueba_flutter/Models.dart';

class PrintPage extends StatefulWidget {
  PrintPage({Key? key}) : super(key: key);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Elementos Seleccionados", 
          style: new TextStyle(
            color: Colors.black
          )
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: body(),
    );
  }

  Widget body(){
    return ListView(
      shrinkWrap: true,
      children: [
        listArea("Deportes", listItemsDeportes, false),
        listArea("Interes", listItemsInteres, false),
        listAreaOtros()
      ],
    );
  }

  Widget listAreaOtros(){
    return Visibility(
      visible: listItemsAlimentos.where((element) => element.isActive).isNotEmpty ||
      listItemsBebidas.where((element) => element.isActive).isNotEmpty ||
      listItemsOtro.where((element) => element.isActive).isNotEmpty,
      child: new Column(
        children: [
          new ListTile(
            tileColor: Colors.amber,
            title: new Text("OTROS"),
          ),
          new Column(
            children: [
              listArea("ALIMENTOS", listItemsAlimentos, true),
              listArea("Bebidas", listItemsBebidas, true),
              listArea("OTROS", listItemsOtro, true)
            ],
          )
        ],
      ),
    );
  }

  Widget listArea(String title,  List<ItemModel> listItems, isSubArea){
    return Visibility(
      visible: listItems.where((element) => element.isActive).isNotEmpty,
      child: new Column(
        children: [
          new ListTile(
            tileColor: isSubArea ? Colors.amberAccent : Colors.amber,
            title: new Text(title),
          ),
          new Column(
            children: listItems.where((element) => element.isActive).map((item) {
              return ListTile(
                title: new Text(item.title),
              );
            }).toList()
          )
        ],
      ),
    );
  }
}


