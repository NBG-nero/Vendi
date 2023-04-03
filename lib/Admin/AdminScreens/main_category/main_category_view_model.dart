import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../category/category_view_model.dart';

class MainCategoryViewModel extends CategoryViewModel {
  Object? selectedValue;
  Object? selVal;
  TextEditingController mainCatNameCtrl = TextEditingController();

  final mformKey = GlobalKey<FormState>();
  bool noCatSelected = false;
  QuerySnapshot? qSnapshot;

  setnoCatselected(val) {
    noCatSelected = val;
    notifyListeners();
  }

  setSelectedVal(val) {
    selectedValue = val;
    notifyListeners();
  }

  setSelVal(value) {
    selVal = value;
    notifyListeners();
  }

  @override
  clear() {
    selectedValue = null;
    mainCatNameCtrl.clear();
    notifyListeners();
  }

  getCatList() {
    return firebaseService.categories.get().then((QuerySnapshot querySnapshot) {
      qSnapshot = querySnapshot;
      notifyListeners();
    });
  }

  uploadTask() {
    EasyLoading.show();
    firebaseService.saveCategory(
      data: {
        'category': selectedValue,
        'mainCategory': mainCatNameCtrl.text,
        'approved': true,
      },
      reference: firebaseService.mainCat,
      docName: mainCatNameCtrl.text,
    ).then((value) {
      clear();
      EasyLoading.dismiss();
    });
  }
}
