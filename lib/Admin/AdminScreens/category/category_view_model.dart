import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

import '../home/admin_home_view_model.dart';
import 'package:vendi/utilities/utils.dart';

class CategoryViewModel extends AdminHomeViewModel {
  // dynamic image;
  String? fileName;
  File? avatarImageFile;
  final TextEditingController catNameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      avatarImageFile = File(result.files.single.path!);
      // image = result.files.first.bytes;
      fileName = result.files.first.name;
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
    EasyLoading.show();
    var ref = firebaseService.firebaseStorage.ref('categoryImage/$fileName');
    try {
      String? mimiType = mime(
        basename(fileName!),
      );
      var metadata = firebase_storage.SettableMetadata(contentType: mimiType);
      firebase_storage.TaskSnapshot uploadSnapshot =
          await ref.putFile(avatarImageFile!, metadata);
      await uploadSnapshot.ref.getDownloadURL().then((value) {
        if (value.isNotEmpty) {
          firebaseService.saveCategory(
            data: {
              'catName': catNameCtrl.text,
              'image': value,
              'active': true,
            },
            reference: firebaseService.categories,
            docName: catNameCtrl.text,
          ).then((value) {
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
}
