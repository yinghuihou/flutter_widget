import 'package:flutter/material.dart';
import 'package:flutter_widget/image_view/jt_image_widget.dart';

class ImageWidgetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ImageWidgetDemoState();
  }
}

class _ImageWidgetDemoState extends State<ImageWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image widget"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  JTImageWidget(
                    imageUrl: 'cat',
                    imageFormat: 'jpg',
                    width: 300,
                    height: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  JTImageWidget(
                    imageUrl: 'avatar',
                    imageFormat: 'png',
                    isCircle: true,
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  JTImageWidget(
                    imageUrl: 'star',
                    imageFormat: 'jpg',
                    borderRadius: 6,
                    width: 300,
                    height: 150,
                  ),
                ],
              )),
        ));
  }
}
