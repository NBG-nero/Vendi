import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/utilities/constants/colors.dart';
import 'package:vendi/utilities/value_validators.dart';
import 'package:vendi/widgets/widgets.dart';

import '../../../utilities/margins/margins.dart';
import 'reset_password_view_model.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetViewModel>.reactive(
        viewModelBuilder: () => ResetViewModel(),
        onModelReady: (r) {
          r.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: VendiColors.masterColor,
            body: Form(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    YMargin(140.h),
                    Align( 
                      alignment: Alignment.centerLeft,
                      child: Text("Please Enter your email to reset your password",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith()),
                    ),
                    YMargin(20.h),
                    VTextField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: false,
                      isMandatory: false,
                      labelText: "Email",
                      hintText: "name@gmail.com",
                      controller: model.rEmailCtrl,
                      validator: (val) => ValueValidator().validateEmail(val),
                    ),
                    YMargin(40.h),
                    VButton(
                      onPressed: () {
                        model.resetPassword(model.rEmailCtrl.text, context);
                      },
                      width: MediaQuery.of(context).size.width * 0.45,
                      buttontext: "Reset Password",
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
