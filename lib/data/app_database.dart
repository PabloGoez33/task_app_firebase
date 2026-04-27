import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../models/plate_model.dart';

part 'app_database.g.dart';

class Plates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get plate => text()();
  TextColumn get description => text()();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get pendingSync => boolean().withDefault(const Constant(true))();
}

@DriftDatabase(tables: [Plates])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'plate_app_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.dart.js'),
      ),
    );
  }

  PlateModel _mapPlateToModel(Plate row) {
    return PlateModel(
      id: row.id,
      plate: row.plate,
      description: row.description,
      completed: row.completed,
      updatedAt: row.updatedAt,
      pendingSync: row.pendingSync,
    );
  }

  Stream<List<PlateModel>> watchPlates() {
    final query = select(plates)
      ..orderBy([
        (t) => OrderingTerm.desc(t.updatedAt),
      ]);

    return query.watch().map(
      (rows) => rows.map(_mapPlateToModel).toList(),
    );
  }

  Future<List<PlateModel>> getAllPlates() async {
    final rows = await select(plates).get();
    return rows.map(_mapPlateToModel).toList();
  }

  Future<PlateModel> insertPlate(PlateModel plate) async {
    final insertedId = await into(plates).insert(
      PlatesCompanion.insert(
        plate: plate.plate,
        description: plate.description,
        completed: Value(plate.completed),
        updatedAt: plate.updatedAt,
        pendingSync: Value(plate.pendingSync),
      ),
    );

    return plate.copyWith(id: insertedId);
  }

  Future<void> updatePlate(PlateModel plate) async {
    if (plate.id == null) return;

    await update(plates).replace(
      Plate(
        id: plate.id!,
        plate: plate.plate,
        description: plate.description,
        completed: plate.completed,
        updatedAt: plate.updatedAt,
        pendingSync: plate.pendingSync,
      ),
    );
  }

  Future<void> toggleCompleted({
    required int id,
    required bool completed,
    String? newDescription,
  }) async {
    await (update(plates)..where((t) => t.id.equals(id))).write(
      PlatesCompanion(
        completed: Value(completed),
        description: newDescription != null ? Value(newDescription) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
        pendingSync: const Value(true),
      ),
    );
  }

  Future<List<PlateModel>> getPendingPlates() async {
    final rows = await (select(plates)..where((t) => t.pendingSync.equals(true))).get();
    return rows.map(_mapPlateToModel).toList();
  }

  Future<void> markAsSynced(int id) async {
    await (update(plates)..where((t) => t.id.equals(id))).write(
      const PlatesCompanion(
        pendingSync: Value(false),
      ),
    );
  }

  Future<void> upsertFromRemote(PlateModel plate) async {
    if (plate.id == null) return;

    await into(plates).insertOnConflictUpdate(
      PlatesCompanion(
        id: Value(plate.id!),
        plate: Value(plate.plate),
        description: Value(plate.description),
        completed: Value(plate.completed),
        updatedAt: Value(plate.updatedAt),
        pendingSync: const Value(false),
      ),
    );
  }
}