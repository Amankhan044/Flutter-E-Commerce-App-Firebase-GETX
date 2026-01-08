import 'package:e_commerce/bindings/bindings.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'utils/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      getPages: UAppRoutes.screens,
      darkTheme: UAppTheme.darkTheme,
      initialBinding: UBindings(),
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: UColors.primary,),
        ),
      ),
    );
  }
}

