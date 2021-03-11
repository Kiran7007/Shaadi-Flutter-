import 'package:flutter/material.dart';
import 'package:flutter_shaadi/app/data/db/people_dao.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';
import 'package:flutter_shaadi/app/data/provider.dart/api.dart';

class PeopleRepository {
  final RemoteSource remoteSource;
  final PeopleDao peopleDao;

  PeopleRepository({@required this.remoteSource, @required this.peopleDao})
      : assert(remoteSource != null),
        assert(peopleDao != null);

  fetchRemoteData() {
    remoteSource.getAll().then((data) => setAll(data));
  }

  fetchLocalData() {
    return peopleDao.fetchPeoples();
  }

  setAll(List<People> list) async {
    await peopleDao.insertAll(list);
  }
}
