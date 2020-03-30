import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FloatingActionButton(
          onPressed: () {
            Share.share('check out my website https://example.com');
          },
          child: Text("share"),
        ),
      ),
    );
  }
}
