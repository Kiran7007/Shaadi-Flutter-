import 'package:flutter_shaadi/app/bindings/home_binding.dart';
import 'package:flutter_shaadi/app/routes/app_routes.dart';
import 'package:flutter_shaadi/app/ui/home/home_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL, page: () => HomeScreen()),
  ];
}
