import 'package:flutter/material.dart';
import 'package:flutter_widget/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugProfileBuildsEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Widget Home Page'),
    );
  }
}
