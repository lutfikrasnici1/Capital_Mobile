import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/user/dropdown.dart';
import 'package:flutter_application_1/user/filePicker.dart';
import 'package:flutter_genius_scan/flutter_genius_scan.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';

class uploadFiles extends StatelessWidget {
  const uploadFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            // BU BUTON DOSYA TARAMAK ICIN KULLANILMISTIR
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FlutterGeniusScan.scanWithConfiguration({
                        'source': 'camera',
                        'multiPage': true,
                      }).then((result) {
                        String pdfUrl = result['pdfUrl'];
                        OpenFile.open(pdfUrl.replaceAll("file://", '')).then(
                            (result) => debugPrint(result.message),
                            onError: (error) => displayError(context, error));
                      }, onError: (error) => displayError(context, error));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.switch_camera),
                        Text("  START SCANNING")
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            // BU BUTON DOSYA YUKLEMEK ICIN KULLANILMISTIR.
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                child: SizedBox(
                  width: 350,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      MyApp();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.cloud_upload),
                        Text("  UPLOAD DOCUMENT")
                      ],
                    ),
                  ),
                ),
              ),
            ),

            DropDownDemo(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                  width: 350,
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Type your explanation here..."),
                  )),
            )
            ,Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                MyApp();
              }, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("SEND",style: TextStyle(fontSize: 18),),
              )),
            )
          ],
        )
      ],
    ));
  }

  void displayError(BuildContext context, PlatformException error) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error.message!)));
  }
}
