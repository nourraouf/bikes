/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class Camera {
  // list<Asset> images = List<Asset>();
  // static List<Asset> images = List<Asset>();
  File _image = null;
  String _error = 'No Error Dectected';

  Future getImage() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);

    try {
      this._image = File(image.path);
      return (_image);
    } catch (e) {
      return null;
    }
  }

  static Future<Asset> loadAssets() async {
    List<Asset> images = List<Asset>();
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      print(error);
      print('**********************************************');
      return null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

    return images;
  }
}
*/
