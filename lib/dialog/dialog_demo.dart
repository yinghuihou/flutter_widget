import 'package:flutter/material.dart';
import 'package:flutter_widget/dialog/jt_common_dialog.dart';
import 'package:flutter_widget/image_view/jt_image_widget.dart';

class DialogWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("dialog demo"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      JTCommonDialog(
                        contentString: "这是测试dialog",
                        confirmText: "ok",
                        cancelText: "cancel",
                      ).show(context);
                    },
                    child:  Container(
                      width: 250,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("普通dialog"),
                    )
                  ),
                ],
              )),
        ));
  }
}
