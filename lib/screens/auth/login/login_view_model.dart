import 'package:flutter/material.dart';

import '../../base_model.dart';

class LoginViewModel extends BaseModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
}
