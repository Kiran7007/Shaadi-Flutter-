import 'package:flutter_shaadi/app/controller/home_controller.dart';
import 'package:flutter_shaadi/app/data/provider/api.dart';
import 'package:flutter_shaadi/app/data/repository/people_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<RemoteSource>(
      () => RemoteSource(
        httpClient: http.Client(),
      ),
    );

    Get.lazyPut<HomeController>(
      () {
        return HomeController(
          repository:
              PeopleRepository(remoteSource: Get.find()),
        );
      },
    );
  }
}
