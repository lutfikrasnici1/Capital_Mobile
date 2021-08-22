import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
        child: DropdownButton<String>(
          value: _chosenValue,
          //elevation: 5,
          style: TextStyle(color: Colors.indigoAccent, fontSize: 16),

          items: <String>[
            'Android',
            'IOS',
            'Flutter',
            'Node',
            'Java',
            'Python',
            'PHP',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            "Choose category of document",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          onChanged: (value) {
            setState(() {
              _chosenValue = value;
            });
          },
        ),
      ),
    );
  }
}
