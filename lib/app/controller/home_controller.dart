import 'package:get/get.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/data/repository/people_repository.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final PeopleRepository repository;

  var _peopleList = List<People>().obs;
  get peopleList => this._peopleList.value;
  set peopleList(value) => this._peopleList.value = value;

  HomeController({@required this.repository}) : assert(repository != null) {
    repository.peopleDao.fetchPeoples().listen(
      (value) {
        print('HomeController fetching local data $value');
        this._peopleList = value;
      },
    );
  }

  getAll() {
    print('HomeController method called');
    if (_peopleList.value.isEmpty) {
      print('HomeController fetching remote data');
      repository.fetchRemoteData();
    }
  }
}
