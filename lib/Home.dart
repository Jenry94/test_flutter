import 'package:flutter/material.dart';
import 'package:prueba_flutter/Models.dart';
import 'package:prueba_flutter/PrintPage.dart';
import 'package:prueba_flutter/TabsWidget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
          title: Text("Título", 
            style: new TextStyle(
              color: Colors.black
            )
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: body()
    );
  }

  Widget body(){
    return Column(
      children: [
        title(),
        tabs(),
        saveButton(),
      ],
    );
  }

  Widget title(){
    return Text(
      "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Aliquam fermemtum, ex et mattis dapibus",
      textAlign: TextAlign.center,
      style: new TextStyle(
        fontSize: MediaQuery.of(context).size.width * .035,
        fontWeight: FontWeight.bold
      ),
    );
  }

  tabs(){
    return Expanded(
      child: new TabsWidget(
        isCustom: false,
        listTabModel: [
          new TabModel("DEPORTES", listItemsDeportes),
          new TabModel("INTERES", listItemsInteres),
        ],
        customTab: CustomTabModel("OTROS", 
          new TabsWidget(
            isCustom: true,
            listTabModel: [
              new TabModel("ALIMENTOS", listItemsAlimentos),
              new TabModel("BEBIDAS", listItemsBebidas),
              new TabModel("TEXTOLARGOPARAPROBARMENU", listItemsOtro),
            ]
          )
        )
      ),
    );
  }

  Widget saveButton(){
    return SafeArea(
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .1,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(.5)),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)),
              ),
              child: new Text("GUARDAR"),
              onPressed:(){
                if(validateData()){
                   Navigator.push(context,MaterialPageRoute(builder: (context) => new PrintPage()));
                }
              },
            ),
            new IconButton(
              color: Colors.amber,
              icon: new Icon(Icons.help_outline),
              onPressed: (){
                showHelpDialog();
              },
            )
          ],
        ),
      )
    );
  }

  showHelpDialog(){
    showDialog(
      barrierColor: Colors.white.withOpacity(0.75),
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Atención"),
          content: new Text("Al guardar, podrás ver tus elementos seleccionados"),
          actions: [
            new OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(.5)),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)),
              ),
              child: new Text("ENTENDIDO"),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }
  validateData(){
    if(listItemsDeportes.where((element) => element.isActive).isNotEmpty ||
    listItemsInteres.where((element) => element.isActive).isNotEmpty ||
    listItemsOtro.where((element) => element.isActive).isNotEmpty ||
    listItemsAlimentos.where((element) => element.isActive).isNotEmpty ||
    listItemsBebidas.where((element) => element.isActive).isNotEmpty){
      return true;
    }
    return false;
  }
}


