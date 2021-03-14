import 'package:get/get.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/data/repository/people_repository.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final PeopleRepository repository;

  var _peopleList = RxList<People>();
  get peopleList => this._peopleList.value;
  set peopleList(value) => this._peopleList.value = value;

  HomeController({@required this.repository}) : assert(repository != null) {
    repository.fetchLocalData().listen(
      (value) {
        print('HomeController fetching local data $value');
        this._peopleList.value = value;
      },
    );
  }

  getAll() {
    print('HomeController method called');
    if (peopleList.length < 1) {
      print('HomeController fetching remote data');
      repository.fetchRemoteData().then((data) {
        repository.setAll(data);
      });
    }
  }

  updatePeople(People people, bool isAccepted) {
    people.isUpdated = true;
    people.connectionStatus = isAccepted ? 'accepted' : 'declined';
    people.updatedAt = DateTime.now().millisecondsSinceEpoch;
    repository.update(people);
  }
}
