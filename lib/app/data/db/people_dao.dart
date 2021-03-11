import 'package:floor/floor.dart';
import 'package:flutter_shaadi/app/data/model/people.dart';

@dao
abstract class PeopleDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertAll(List<People> people);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insert(People people);

  @Query('SELECT * FROM people')
  Stream<List<People>> fetchPeoples();

  @update
  Future<void> updateData(People people);
}
