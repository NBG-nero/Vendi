import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../home/admin_home_view_model.dart';
import 'package:vendi/utilities/utils.dart';

class CategoryViewModel extends AdminHomeViewModel {
  dynamic image;
  String? fileName;
  File? avatarImageFile;
  final TextEditingController catNameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      avatarImageFile = File(result.files.single.path!);
      image = result.files.first.bytes;
      fileName = result.files.first.name;
      // fileName = result.files.single.name;
      log(fileName.toString());
      notifyListeners();
    } else {
      showErrorToast("Image select failed");
      log('Cancelled or failed');
      notifyListeners();
    }
    notifyListeners();
  }

  uploadImage() async {
    // setBusy(true);
    EasyLoading.show();
    var ref = firebaseService.firebaseStorage.ref('categoryImage/$fileName');
    try {
      await ref.putFile(avatarImageFile!);
      await ref.getDownloadURL().then((value) {
        if (value.isNotEmpty) {
          firebaseService.saveCategory({
            'catName': catNameCtrl.text,
            'image': value,
            'active': true,
          }).then((value) {
            clear();
            EasyLoading.dismiss();
          });
        }
        setBusy(false);
        notifyListeners();
        return value;
      });
    } on FirebaseException catch (e) {
      clear();
      EasyLoading.dismiss();
      log(e.toString());
      showErrorToast(e.toString());
      notifyListeners();
    }
  }

  clear() {
    catNameCtrl.clear();
    avatarImageFile = null;
    notifyListeners();
  }



  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile = await imagePicker
        .pickImage(source: ImageSource.gallery)
        .catchError((err) {
      showErrorToast(err.toString());
      return err;
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
