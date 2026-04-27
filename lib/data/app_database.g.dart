// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlatesTable extends Plates with TableInfo<$PlatesTable, Plate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _plateMeta = const VerificationMeta('plate');
  @override
  late final GeneratedColumn<String> plate = GeneratedColumn<String>(
    'plate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<bool> pendingSync = GeneratedColumn<bool>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pending_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    plate,
    description,
    completed,
    updatedAt,
    pendingSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plates';
  @override
  VerificationContext validateIntegrity(
    Insertable<Plate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('plate')) {
      context.handle(
        _plateMeta,
        plate.isAcceptableOrUnknown(data['plate']!, _plateMeta),
      );
    } else if (isInserting) {
      context.missing(_plateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      plate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plate'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pending_sync'],
      )!,
    );
  }

  @override
  $PlatesTable createAlias(String alias) {
    return $PlatesTable(attachedDatabase, alias);
  }
}

class Plate extends DataClass implements Insertable<Plate> {
  final int id;
  final String plate;
  final String description;
  final bool completed;
  final DateTime updatedAt;
  final bool pendingSync;
  const Plate({
    required this.id,
    required this.plate,
    required this.description,
    required this.completed,
    required this.updatedAt,
    required this.pendingSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['plate'] = Variable<String>(plate);
    map['description'] = Variable<String>(description);
    map['completed'] = Variable<bool>(completed);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['pending_sync'] = Variable<bool>(pendingSync);
    return map;
  }

  PlatesCompanion toCompanion(bool nullToAbsent) {
    return PlatesCompanion(
      id: Value(id),
      plate: Value(plate),
      description: Value(description),
      completed: Value(completed),
      updatedAt: Value(updatedAt),
      pendingSync: Value(pendingSync),
    );
  }

  factory Plate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plate(
      id: serializer.fromJson<int>(json['id']),
      plate: serializer.fromJson<String>(json['plate']),
      description: serializer.fromJson<String>(json['description']),
      completed: serializer.fromJson<bool>(json['completed']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      pendingSync: serializer.fromJson<bool>(json['pendingSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'plate': serializer.toJson<String>(plate),
      'description': serializer.toJson<String>(description),
      'completed': serializer.toJson<bool>(completed),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'pendingSync': serializer.toJson<bool>(pendingSync),
    };
  }

  Plate copyWith({
    int? id,
    String? plate,
    String? description,
    bool? completed,
    DateTime? updatedAt,
    bool? pendingSync,
  }) => Plate(
    id: id ?? this.id,
    plate: plate ?? this.plate,
    description: description ?? this.description,
    completed: completed ?? this.completed,
    updatedAt: updatedAt ?? this.updatedAt,
    pendingSync: pendingSync ?? this.pendingSync,
  );
  Plate copyWithCompanion(PlatesCompanion data) {
    return Plate(
      id: data.id.present ? data.id.value : this.id,
      plate: data.plate.present ? data.plate.value : this.plate,
      description: data.description.present
          ? data.description.value
          : this.description,
      completed: data.completed.present ? data.completed.value : this.completed,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plate(')
          ..write('id: $id, ')
          ..write('plate: $plate, ')
          ..write('description: $description, ')
          ..write('completed: $completed, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingSync: $pendingSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, plate, description, completed, updatedAt, pendingSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plate &&
          other.id == this.id &&
          other.plate == this.plate &&
          other.description == this.description &&
          other.completed == this.completed &&
          other.updatedAt == this.updatedAt &&
          other.pendingSync == this.pendingSync);
}

class PlatesCompanion extends UpdateCompanion<Plate> {
  final Value<int> id;
  final Value<String> plate;
  final Value<String> description;
  final Value<bool> completed;
  final Value<DateTime> updatedAt;
  final Value<bool> pendingSync;
  const PlatesCompanion({
    this.id = const Value.absent(),
    this.plate = const Value.absent(),
    this.description = const Value.absent(),
    this.completed = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
  });
  PlatesCompanion.insert({
    this.id = const Value.absent(),
    required String plate,
    required String description,
    this.completed = const Value.absent(),
    required DateTime updatedAt,
    this.pendingSync = const Value.absent(),
  }) : plate = Value(plate),
       description = Value(description),
       updatedAt = Value(updatedAt);
  static Insertable<Plate> custom({
    Expression<int>? id,
    Expression<String>? plate,
    Expression<String>? description,
    Expression<bool>? completed,
    Expression<DateTime>? updatedAt,
    Expression<bool>? pendingSync,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plate != null) 'plate': plate,
      if (description != null) 'description': description,
      if (completed != null) 'completed': completed,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
    });
  }

  PlatesCompanion copyWith({
    Value<int>? id,
    Value<String>? plate,
    Value<String>? description,
    Value<bool>? completed,
    Value<DateTime>? updatedAt,
    Value<bool>? pendingSync,
  }) {
    return PlatesCompanion(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      updatedAt: updatedAt ?? this.updatedAt,
      pendingSync: pendingSync ?? this.pendingSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (plate.present) {
      map['plate'] = Variable<String>(plate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<bool>(pendingSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlatesCompanion(')
          ..write('id: $id, ')
          ..write('plate: $plate, ')
          ..write('description: $description, ')
          ..write('completed: $completed, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingSync: $pendingSync')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlatesTable plates = $PlatesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [plates];
}

typedef $$PlatesTableCreateCompanionBuilder =
    PlatesCompanion Function({
      Value<int> id,
      required String plate,
      required String description,
      Value<bool> completed,
      required DateTime updatedAt,
      Value<bool> pendingSync,
    });
typedef $$PlatesTableUpdateCompanionBuilder =
    PlatesCompanion Function({
      Value<int> id,
      Value<String> plate,
      Value<String> description,
      Value<bool> completed,
      Value<DateTime> updatedAt,
      Value<bool> pendingSync,
    });

class $$PlatesTableFilterComposer
    extends Composer<_$AppDatabase, $PlatesTable> {
  $$PlatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlatesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlatesTable> {
  $$PlatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlatesTable> {
  $$PlatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plate =>
      $composableBuilder(column: $table.plate, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );
}

class $$PlatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlatesTable,
          Plate,
          $$PlatesTableFilterComposer,
          $$PlatesTableOrderingComposer,
          $$PlatesTableAnnotationComposer,
          $$PlatesTableCreateCompanionBuilder,
          $$PlatesTableUpdateCompanionBuilder,
          (Plate, BaseReferences<_$AppDatabase, $PlatesTable, Plate>),
          Plate,
          PrefetchHooks Function()
        > {
  $$PlatesTableTableManager(_$AppDatabase db, $PlatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> plate = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> completed = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> pendingSync = const Value.absent(),
              }) => PlatesCompanion(
                id: id,
                plate: plate,
                description: description,
                completed: completed,
                updatedAt: updatedAt,
                pendingSync: pendingSync,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String plate,
                required String description,
                Value<bool> completed = const Value.absent(),
                required DateTime updatedAt,
                Value<bool> pendingSync = const Value.absent(),
              }) => PlatesCompanion.insert(
                id: id,
                plate: plate,
                description: description,
                completed: completed,
                updatedAt: updatedAt,
                pendingSync: pendingSync,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlatesTable,
      Plate,
      $$PlatesTableFilterComposer,
      $$PlatesTableOrderingComposer,
      $$PlatesTableAnnotationComposer,
      $$PlatesTableCreateCompanionBuilder,
      $$PlatesTableUpdateCompanionBuilder,
      (Plate, BaseReferences<_$AppDatabase, $PlatesTable, Plate>),
      Plate,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlatesTableTableManager get plates =>
      $$PlatesTableTableManager(_db, _db.plates);
}
