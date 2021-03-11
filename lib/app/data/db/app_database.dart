import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_shaadi/app/data/db/people_dao.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [People])
abstract class AppDatabase extends FloorDatabase {
  PeopleDao get peopleDao;
}
