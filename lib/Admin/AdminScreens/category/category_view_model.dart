import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../home/admin_home_view_model.dart';
import 'package:vendi/utilities/utils.dart';

class CategoryViewModel extends AdminHomeViewModel {
  dynamic image;
  String? fileName;
  File? avatarImageFile;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      image = result.files.first.bytes;
      fileName = result.files.first.name;

      notifyListeners();
    } else {
      showErrorToast("Image select failed");
      log('Cancelled or failed');
      notifyListeners();
    }

    notifyListeners();
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .catchError((err) {
      showErrorToast(err.toString());
    });
    File? image;
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    if (image != null) {
      avatarImageFile = image;
      setBusy(true);
      notifyListeners();
    } else {
      setBusy(false);
      notifyListeners();
    }
  }
}
