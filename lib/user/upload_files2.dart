import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_genius_scan/flutter_genius_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';

import 'dropdown.dart';

class UploadFilesNow extends StatefulWidget {
  const UploadFilesNow({Key? key}) : super(key: key);

  @override
  _UploadFilesNowState createState() {
    return _UploadFilesNowState();
}
}

class _UploadFilesNowState extends State<UploadFilesNow> {
  late String _fileName;
  late String _path;
  late Map<String, String> _paths;
  late String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  late FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if ( _pickingType != FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = '...';
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        } else {

          _path = await FilePicker.getFilePath(
              type: _pickingType, allowedExtensions: [_extension]);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : '...';
      });
    }
  }

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
                      _openFileExplorer();
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SEND",
                      style: TextStyle(fontSize: 18),
                    ),
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
