import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/data/db/app_database.dart';
import 'package:flutter_shaadi/app/routes/app_pages.dart';
import 'package:flutter_shaadi/app/routes/app_routes.dart';
import 'package:flutter_shaadi/app/ui/home/home_page.dart';
import 'package:get/get.dart';

import 'app/bindings/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
          await $FloorAppDatabase.databaseBuilder('shaadi.db').build();
  Get.put(database.peopleDao);      

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialBinding: HomeBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
    ),
  );
}
