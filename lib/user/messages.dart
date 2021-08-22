import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);



  @override
  _MessagesState createState() => _MessagesState();


}

class _MessagesState extends State<Messages> {

  static List<String> items = <String>['1.mesaj','2.mesaj','3.mesaj','4.mesaj'];
  static List<String> dates = <String>['27/8/2021', '16/9/2021', '9/9/2022','09/02/2025'];
  Widget buildListView() => ListView.separated(
    separatorBuilder: (context, index) => Divider(color: HexColor("#b9986a")),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return Dismissible(
        key: Key(item),
        onDismissed: (direction) {
          // Remove the item from the data source.
          setState(() {
            items.removeAt(index);
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item dismissed'),  duration: Duration(seconds: 1, milliseconds: 100)));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 4, 10, 0),
          decoration: BoxDecoration(
              border: Border.all(
                  color: HexColor("#b9986a")
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: ListTile(
                contentPadding: EdgeInsets.all(8),
                title: Text(item),
                subtitle: Text("Content of message"),
                trailing: Icon(Icons.delete, color: Colors.red,),
                onTap: () => {          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Swipte to dismiss'),  duration: Duration(seconds: 1, milliseconds: 100)))}
            ),
          ),
        ),
      );
      });

  @override
  Widget build(BuildContext context) {
     return buildListView();
  }
}
