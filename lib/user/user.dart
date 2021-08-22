import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/user/activities.dart';
import 'messages.dart';
import 'upload_files2.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)),
      child: UploadFilesNow(),
    ),
    Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 900,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.accents[4],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your information"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Last Login : 27.10.2021 15:46"),
                      ),
                    ],
                  ),
                )),
          ),
          Expanded(
            child: Messages(),
          )
        ],
      ),
    ),
    activities(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_folder_upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_sharp),
            label: 'Activities',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
