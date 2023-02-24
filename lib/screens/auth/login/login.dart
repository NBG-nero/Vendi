import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../routes/router.gr.dart';
import '../../../utilities/constants/constants.dart';
import '../../../utilities/margins/margins.dart';
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
                    YMargin(100.h),
                    Text('Welcome back',
                        style: TextStyle(
                            fontSize: 26.sp, color: VendiColors.primaryColor)),
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
                                 
                              ),
                              YMargin(35.h), 
                              
                            ],
                          ),
                        )),
                    YMargin(20.h),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)))),
                            backgroundColor: MaterialStateProperty.all(
                                VendiColors.colorMap[700])),
                        onPressed: () {
                          AutoRouter.of(context).pushAndPopUntil(
                              const BottomNav(),
                              predicate: (route) => false);
                        },
                        child: const Text('Login'),
                      ),
                    ),
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
