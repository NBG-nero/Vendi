import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';
import 'package:vendi/Admin/AdminScreens/main_category/main_category_view_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../utilities/utils.dart';

class SubCategoryViewModel extends MainCategoryViewModel {
  String? subfileName;

  File? imageFile;
  final TextEditingController subcatNameCtrl = TextEditingController();
  final sformKey = GlobalKey<FormState>();

  @override
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      imageFile = File(result.files.single.path!);
      // image = result.files.first.bytes;
      subfileName = result.files.first.name;
      log(subfileName.toString());
      notifyListeners();
    } else {
      showErrorToast("Image select failed");
      log('Cancelled or failed');
      notifyListeners();
    }
    notifyListeners();
  }

  @override
  uploadImage() async {
    EasyLoading.show();
    var ref =
        firebaseService.firebaseStorage.ref('subCategoryImage/$subfileName');
    try {
      String? mimiType = mime(
        basename(subfileName!),
      );
      var metadata = firebase_storage.SettableMetadata(contentType: mimiType);
      firebase_storage.TaskSnapshot uploadSnapshot =
          await ref.putFile(imageFile!, metadata);
      await uploadSnapshot.ref.getDownloadURL().then((value) {
        if (value.isNotEmpty) {
          firebaseService.saveCategory(
            data: {
              'subCatName': subcatNameCtrl.text,
              'image': '$value.png',
              'active': true,
            },
            reference: firebaseService.categories,
            docName: subcatNameCtrl.text,
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

  @override
  clear() {
    subcatNameCtrl.clear();
    imageFile = null;
    notifyListeners();
  }
}
