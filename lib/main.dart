import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/bindings/home_binding.dart';
import 'package:flutter_shaadi/app/routes/app_pages.dart';
import 'package:flutter_shaadi/app/routes/app_routes.dart';
import 'package:flutter_shaadi/app/ui/home/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: Routes.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
    ),
  );
}
  