import 'package:flutter/material.dart';
import 'package:prueba_flutter/Models.dart';

class GeneralView extends StatefulWidget {
  final List<ItemModel> listItems;
  final int gridItems;
  GeneralView(
    {
      Key? key,
      required this.listItems,
      required this.gridItems
    }) : super(key: key);

  @override
  _GeneralViewState createState() => _GeneralViewState();
}


class _GeneralViewState extends State<GeneralView> {
  bool selectAll = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title(),
        checkSelectAll(),
        listElements(),
      ],
    );
  }

  Widget title(){
    return RichText(
      text: TextSpan(
        text: "Selecciona",
        style: new TextStyle(
          fontSize: MediaQuery.of(context).size.width * .03,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        children: [
          TextSpan(
            text: " los ", 
            style: new TextStyle(
              fontSize: MediaQuery.of(context).size.width * .03,
              fontWeight: FontWeight.bold,
              color: Colors.amber
            )
          ),
          TextSpan(
            text: "que más te gusten", 
            style: new TextStyle(
              fontSize: MediaQuery.of(context).size.width * .03,
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          )
        ]
      )
    );
  }

  Widget checkSelectAll(){
    return CheckboxListTile(
      activeColor: Colors.amber,
      contentPadding: EdgeInsets.only(
        left: (MediaQuery.of(context).size.width * .275),
        right: (MediaQuery.of(context).size.width * .275)
      ),
      title: new Text(
        "Seleccionar todos",
        style: new TextStyle(
          fontSize: MediaQuery.of(context).size.width * .03,
          fontWeight: FontWeight.bold
        ),
      ),
      value: selectAll || widget.listItems.where((element) => element.isActive).length == widget.listItems.length, 
      onChanged: (bool? value) {
        setState(() {
          selectAll = value!;
          changeSelects(value);
        });
      },
    );
  }

  Widget listElements(){
    return Expanded(
      child: new GridView.count(
        crossAxisCount: widget.gridItems,
        shrinkWrap: true,
        children: widget.listItems.map((item){
          return TextButton(
            child: new Text(
              item.title,
              style: new TextStyle(
                fontSize: MediaQuery.of(context).size.width * .03,
                color: item.isActive ? Colors.amber : Colors.black
              ),
            ),
            onPressed: (){
              setState(() {
                item.setActive(!item.isActive);
              });
            },
          );
        }).toList(),
      ),
    );
  }

  changeSelects(bool value){
    widget.listItems.forEach((item) {
      setState(() {
        item.setActive(value);
      });
    });
  }
}


