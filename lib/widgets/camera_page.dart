import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Future<void> main() async {
//  runApp(CameraApp());
//}

class CameraApp extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<CameraApp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            GestureDetector(
              child: Text('Take a picture'),
              onTap: openCamera,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            GestureDetector(
              child: Text('Select from gallery'),
              onTap: openGallery,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var picture = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    print(picture);
  }

  void openGallery() async {
    var gallery = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    print(gallery);
  }
}

//class _CameraAppState extends State<CameraApp> {
//  CameraController controller;
//  List<CameraDescription> cameras;
//
//  @override
//  void initState() {
//    super.initState();
//    getAvailableCameras();
//  }
//
//  @override
//  void dispose() {
//    controller?.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (!controller.value.isInitialized) {
//      return Container();
//    }
//    return AspectRatio(
//        aspectRatio: controller.value.aspectRatio,
//        child: CameraPreview(controller));
//  }
//
//  Future<void> getAvailableCameras() async {
//    cameras = await availableCameras();
//    controller = CameraController(cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted) {
//        return;
//      }
//      setState(() {});
//    });
//  }
//}
