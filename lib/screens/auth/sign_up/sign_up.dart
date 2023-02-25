import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:vendi/screens/auth/sign_up/sign_up_view_model.dart';
import 'package:vendi/utilities/constants/colors.dart';

import '../../../routes/router.gr.dart';
import '../../../utilities/margins/margins.dart';
import '../../../utilities/value_validators.dart';
import '../../../widgets/widgets.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        onModelReady: (si) {
          si.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: VendiColors.primaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      YMargin(180.h),
                      Text('Welcome!',
                          style: TextStyle(
                              fontSize: 26.sp, color: VendiColors.masterColor)),
                      YMargin(20.h),
                      Form(
                        key: model.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              VTextField(
                                isMandatory: false,
                                obscureText: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'Name',
                                hintText: 'Deidre',
                                controller: model.nameCtrl,
                                validator: (val) =>
                                    ValueValidator().validateName(val),
                              ),
                              YMargin(35.h),
                              VTextField(
                                obscureText: false,
                                isMandatory: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'Email',
                                hintText: "name@email.com",
                                controller: model.emailCtrl,
                                validator: (val) =>
                                    ValueValidator().validateEmail(val),
                              ),
                              YMargin(35.h),
                              VTextField(
                                obscureText: model.hidePassword,
                                isMandatory: false,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                labelText: 'Password',
                                hintText: '*********',
                                controller: model.passwordCtrl,
                                validator: (val) =>
                                    ValueValidator().validatePassword(val),
                                suffix: model.hidePassword
                                    ? Icon(Icons.visibility_off,
                                        size: 20.h,
                                        color: VendiColors.secondaryColor)
                                    : Icon(Icons.visibility,
                                        size: 20.h,
                                        color: VendiColors.secondaryColor),
                                onSuffixPressed: () {
                                  model.toogleHidePassword();
                                },
                              ),
                              YMargin(15.h),
                              VButton(
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).pushAndPopUntil(
                              const Loginscreen(),
                              predicate: (route) => false);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an account ?",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: VendiColors.masterColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " Login",
                                  style: TextStyle(
                                      color: VendiColors.secondaryColor,
                                      fontStyle: FontStyle.italic))
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
