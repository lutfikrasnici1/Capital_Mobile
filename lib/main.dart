import 'package:flutter/material.dart';
import 'user/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'user/user.dart';
import 'admin/admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark,
          primaryColor: HexColor("#b9986a"),
          hintColor: HexColor("#b9986a")),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Capital Accounting L.L.C"),
        ),
        body: UserPage(),
      ),
    );
  }
}
