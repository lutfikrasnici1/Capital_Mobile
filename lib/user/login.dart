import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/capital_logo.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: FloatingActionButton.extended(
              backgroundColor: HexColor("#b9986a"),
              label: Text(
                "Log In",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () => {print("object")},
            ),
          )
        ],
      ),
    );
  }
}
