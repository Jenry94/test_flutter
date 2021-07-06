import 'package:flutter/material.dart';
import 'package:prueba_flutter/GeneralView.dart';
import 'package:prueba_flutter/Models.dart';

class TabsWidget extends StatefulWidget {
  final List<TabModel> listTabModel;
  final CustomTabModel? customTab;
  final bool isCustom;

  TabsWidget(
    {
      Key? key,
      required this.listTabModel,
      this.customTab,
      required this.isCustom

    }) : super(key: key);

  @override
  _TabsWidgetState createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:  body(),
    );
  }

  Widget body(){
    return Column(
      children: [
        tabs(),
        tabView(),
      ],
    );
  }

  tabs(){
    return TabBar(
      isScrollable: widget.isCustom,
      labelStyle: new TextStyle(
        fontSize: widget.isCustom ? MediaQuery.of(context).size.width * .0225 : MediaQuery.of(context).size.width * .035,
        fontWeight: FontWeight.bold
      ),
      labelColor: Colors.amber,
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      tabs: getTitlesTabs().map((name) {
        return Tab(
          text: name,
        );
      } ).toList()
    );
  }

  List<String> getTitlesTabs(){
    List<String> titles = [];
    widget.listTabModel.forEach((element) {
      titles.add(element.title);
    });
    if(widget.customTab != null){
      titles.add(widget.customTab!.title);
    }
    return titles;
  }

  Widget tabView(){
    return Expanded(
      child: new TabBarView(
        children: getWidgedView().map<Widget>((Widget widget){
          return widget;
        }).toList()
      )
    );
  }

  getWidgedView(){
    List<Widget> widgets = [];
    widget.listTabModel.forEach((tab) {
      widgets.add(GeneralView(listItems: tab.listItems, gridItems: widget.isCustom ? 4 : 3));
    });
    if(widget.customTab != null){
      widgets.add(widget.customTab!.widget);
    }
    return widgets;
  }
}


