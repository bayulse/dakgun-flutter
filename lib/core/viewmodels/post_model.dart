import 'dart:io';

import 'package:image_picker/image_picker.dart';

class PostModel {
  List<File> images = [];

  Future getImage() async {
    var img = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      images.add(img);
    }
  }
}
