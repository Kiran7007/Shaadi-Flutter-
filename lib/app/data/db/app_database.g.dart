// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PeopleDao _peopleDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `people` (`email` TEXT, `gender` TEXT, `phone` TEXT, `cell` TEXT, `image_url` TEXT, `initial` TEXT, `full_name` TEXT, `is_updated` INTEGER NOT NULL, `connection_status` TEXT NOT NULL, `updated_at` INTEGER NOT NULL, PRIMARY KEY (`email`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PeopleDao get peopleDao {
    return _peopleDaoInstance ??= _$PeopleDao(database, changeListener);
  }
}

class _$PeopleDao extends PeopleDao {
  _$PeopleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _peopleInsertionAdapter = InsertionAdapter(
            database,
            'people',
            (People item) => <String, dynamic>{
                  'email': item.email,
                  'gender': item.gender,
                  'phone': item.phone,
                  'cell': item.cell,
                  'image_url': item.imageUrl,
                  'initial': item.initial,
                  'full_name': item.fullName,
                  'is_updated': item.isUpdated ? 1 : 0,
                  'connection_status': item.connectionStatus,
                  'updated_at': item.updatedAt
                },
            changeListener),
        _peopleUpdateAdapter = UpdateAdapter(
            database,
            'people',
            ['email'],
            (People item) => <String, dynamic>{
                  'email': item.email,
                  'gender': item.gender,
                  'phone': item.phone,
                  'cell': item.cell,
                  'image_url': item.imageUrl,
                  'initial': item.initial,
                  'full_name': item.fullName,
                  'is_updated': item.isUpdated ? 1 : 0,
                  'connection_status': item.connectionStatus,
                  'updated_at': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _peopleMapper = (Map<String, dynamic> row) => People(
      email: row['email'] as String,
      gender: row['gender'] as String,
      phone: row['phone'] as String,
      cell: row['cell'] as String,
      fullName: row['full_name'] as String,
      initial: row['initial'] as String,
      imageUrl: row['image_url'] as String,
      isUpdated: (row['is_updated'] as int) != 0,
      updatedAt: row['updated_at'] as int,
      connectionStatus: row['connection_status'] as String);

  final InsertionAdapter<People> _peopleInsertionAdapter;

  final UpdateAdapter<People> _peopleUpdateAdapter;

  @override
  Stream<List<People>> fetchPeoples() {
    return _queryAdapter.queryListStream('SELECT * FROM people',
        queryableName: 'people', isView: false, mapper: _peopleMapper);
  }

  @override
  Future<void> insertAll(List<People> people) async {
    await _peopleInsertionAdapter.insertList(people, OnConflictStrategy.ignore);
  }

  @override
  Future<void> insert(People people) async {
    await _peopleInsertionAdapter.insert(people, OnConflictStrategy.ignore);
  }

  @override
  Future<void> updateData(People people) async {
    await _peopleUpdateAdapter.update(people, OnConflictStrategy.abort);
  }
}
