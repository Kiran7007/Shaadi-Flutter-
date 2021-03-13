import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/data/db/people_dao.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/data/provider.dart/api.dart';
import 'package:get/get.dart';

class PeopleRepository {
  final RemoteSource remoteSource;

  PeopleRepository({@required this.remoteSource})
      : assert(remoteSource != null);

  fetchRemoteData() => remoteSource.getAll();

  fetchLocalData() => Get.find<PeopleDao>().fetchPeoples();

  setAll(List<People> list) async {
    print("Storing List : $list");
    await Get.find<PeopleDao>().insertAll(list);
  }
}
