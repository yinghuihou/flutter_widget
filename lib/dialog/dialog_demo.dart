import 'package:flutter/material.dart';
import 'package:flutter_widget/dialog/jt_common_dialog.dart';
import 'package:flutter_widget/dialog/over_scroll_behavior.dart';
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
                      child: Container(
                        width: 250,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text("普通dialog"),
                      )),
                  SizedBox(height: 30),
                  FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        JTCommonDialog(
                            cancelText: "cancel",
                            confirmText: "ok",
                            contentWidget: ScrollConfiguration(
                              behavior: JTScrollBehavior(),
                              child: ListView.builder(

                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(top: 16, bottom: 16),
                                    child: Text("这是第${position + 1}个item"),
                                  );
                                },
                                itemCount: 10,
                              ),
                            )).show(context);
                      },
                      child: Container(
                        width: 250,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text("自定义列表的dialog"),
                      )),
                ],
              )),
        ));
  }
}
