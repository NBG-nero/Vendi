import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../category/category_view_model.dart';

class MainCategoryViewModel extends CategoryViewModel {
  Object? selectedValue;
  TextEditingController mainCatNameCtrl = TextEditingController();

  final mformKey = GlobalKey<FormState>();
  bool noCatSelected = false;
  setnoCatselected(val) {
    noCatSelected = val;
    notifyListeners();
  }

  setSelectedVal(val) {
    selectedValue = val;
    notifyListeners();
  }

  @override
  clear() {
    selectedValue = null;
    mainCatNameCtrl.clear();
    notifyListeners();
  }

  uploadTask() {
    EasyLoading.show();
    firebaseService.saveCategory(
data: { 
  'category': selectedValue, 
  'mainCategory': mainCatNameCtrl.text,
  'approved':true, 
  
},
reference: firebaseService.mainCat, 
docName: mainCatNameCtrl.text,
    ).then((value) {
      clear();
      EasyLoading.dismiss();
    });
  }
}
