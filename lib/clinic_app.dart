import 'package:clinic_mobile/core/Routing/app_routre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicApp extends StatelessWidget {
  final AppRoutre appRoutre;
  const ClinicApp({super.key, required this.appRoutre});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child:  MaterialApp(
        debugShowCheckedModeBanner:false,
        onGenerateRoute:appRoutre.generateRoute,
      ),
    );
  }
}
