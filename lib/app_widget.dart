import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/router.gr.dart' as gr;

class Vendi extends StatelessWidget {
  Vendi({Key? key}) : super(key: key);
  final appRouter = gr.AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) {
          return MaterialApp.router(
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
            title: "Vendi",
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            builder: (context, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: Builder(
                    builder: (context) => widget!,
                  ));
            },
          );
        }));
  }
}
