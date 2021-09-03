import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future getImgFromGullery(File _image) async {
  final ImagePicker _picker = ImagePicker();

  // final imge = await ImagePicker().getImage(source: ImageSource.camera);
  final imge = await _picker.pickImage(source: ImageSource.gallery);
  if (imge != null) {
    _image = File(imge.path);
  }
  return _image;
}
