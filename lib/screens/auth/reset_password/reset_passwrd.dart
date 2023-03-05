import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendi/widgets/widgets.dart';

import '../../../utilities/margins/margins.dart';

class Resetpasswordscreen extends StatefulWidget {
  const Resetpasswordscreen({super.key});

  @override
  State<Resetpasswordscreen> createState() => _ResetpasswordscreenState();
}

class _ResetpasswordscreenState extends State<Resetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              YMargin(140.h),
              Text("Please Enter your email to reset your password",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith()),
              VTextField(
                obscureText: false,
                isMandatory: false,
                labelText: "Email",
                hintText: "name@gmail.com",
              ),
              VButton(
                onPressed: () {},
                width: MediaQuery.of(context).size.width * 0.45,
                buttontext: "reset",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
