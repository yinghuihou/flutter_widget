import 'package:flutter/material.dart';
import 'package:flutter_widget/city_select/city_select_custom_header.dart';
import 'package:flutter_widget/image_view/image_widget_demo.dart';
import 'package:flutter_widget/picker/picker_widget_demo.dart';
import 'package:flutter_widget/popup_menu/menu_demo.dart';
import 'package:flutter_widget/share/share_demo.dart';
import 'package:flutter_widget/swiper/swiper_demo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
          child: Column(
            children: <Widget>[
              buildItem("city_select", CitySelectWithHeader()),
              buildItem("image_widget", ImageWidgetDemo()),
              buildItem("swiper(轮播图)", SwiperDemo()),
              buildItem("popup_menu", MenuDemo()),
              buildItem("pick_widget", DateAndTimePickerDemo()),
              buildItem("share", ShareDemo()),
            ],
          ),
        ));
  }

  Widget buildItem(String name, dynamic path) {
    Route<dynamic> route;
    route = MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: name),
        builder: (BuildContext context) {
          return path;
        });
    return GestureDetector(
      onTap: () {
        Navigator.push(context, route);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(4)),
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
