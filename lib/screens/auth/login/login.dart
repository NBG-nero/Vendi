import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../routes/router.gr.dart';
import '../../../utilities/constants/constants.dart';
import '../../../utilities/margins/margins.dart';
import '../../../utilities/value_validators.dart';
import '../../../widgets/widgets.dart';
import 'login_view_model.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        onModelReady: (l) {
          l.setInitialised(true);
        },
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: VendiColors.masterColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    YMargin(180.h),
                    Text('Welcome back',
                        style: TextStyle(
                            fontSize: 26.sp, color: VendiColors.primaryColor)),
                    YMargin(10.h),
                    Text('Hello there, Sign in to continue',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: VendiColors.primaryColor)),
                    YMargin(20.h),
                    Form(
                        key: model.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
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
                              YMargin(12.h),
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    const Resetpasswordscreen(),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('Forget password',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                              fontStyle: FontStyle.italic,
                                              color: VendiColors.primaryColor)),
                                ),
                              ),
                              // YMargin(15.h),
                            ],
                          ),
                        )),
                    YMargin(20.h),
                    Center(
                      child: VButton(
                        onPressed: () {
                          if (model.formKey.currentState!.validate()) {
                            model.setBusy(true);
                            model.logIn(model.emailCtrl.text,
                                model.passwordCtrl.text, 'user', context);
                          } else {
                            AutovalidateMode.onUserInteraction;
                          }
                        },
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: model.isBusy
                            ? const CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text('Sign In',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(color: Colors.white)),
                      ),
                    ),
                    YMargin(20.h),
                    VButton(
                      onPressed: () {
                        model.googleUserSignIn(context);
                      },
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/gSignIn.png',
                              width: 28.w,
                            ),
                            XMargin(20.w),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('continue with google',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: VendiColors.primaryColor)),
                            ),
                          ]),
                    ),
                    YMargin(17.h),
                    TextButton(
                      onPressed: () {
                        AutoRouter.of(context).pushAndPopUntil(
                            const SignUpscreen(),
                            predicate: (route) => false);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account ?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                    color: VendiColors.secondaryColor,
                                    fontStyle: FontStyle.italic))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
