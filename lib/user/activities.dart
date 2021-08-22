import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class activities extends StatefulWidget {
  const activities({Key? key}) : super(key: key);

  @override
  _activitiesState createState() => _activitiesState();
}

class _activitiesState extends State<activities> {
  static List<String> entries = <String>['1.Document','2.Document ','3.Document','4.Document:'];
  static List<String> dates = <String>['27/8/2021 14:55', '16/9/2021 10:30', '9/9/2022 09:55','09/02/2025 24:00'];
  Widget buildListView() => ListView.separated(
    separatorBuilder: (context, index) => Divider(color: HexColor("#b9986a")),
    itemCount: entries.length,
    itemBuilder: (context, index) {
      final item = entries[index];
      final date = dates[index];
      return Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            border: Border.all(
                color: HexColor("#b9986a")
            ),
            borderRadius: BorderRadius.circular(14)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,2,8,2),
          child: ListTile(
            contentPadding: EdgeInsets.all(8),
            title: Text(item ),
            subtitle: Text("sent on date : " + date),
            onTap: ()=>{
              print(item + " will be deleted")
            },
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return buildListView();
  }
}

