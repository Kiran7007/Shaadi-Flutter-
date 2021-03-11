import 'package:flutter_shaadi/app/controller/home_controller.dart';
import 'package:flutter_shaadi/app/data/db/app_database.dart';
import 'package:flutter_shaadi/app/data/provider.dart/api.dart';
import 'package:flutter_shaadi/app/data/repository/people_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.putAsync<HomeController>(
      () async {
        final database =
            await $FloorAppDatabase.databaseBuilder('shaadi.db').build();
        return HomeController(
          repository: PeopleRepository(
            remoteSource: RemoteSource(
              httpClient: http.Client(),
            ),
            peopleDao: database.peopleDao,
          ),
        );
      },
    );
  }
}
