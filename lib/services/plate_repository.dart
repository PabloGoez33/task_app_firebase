import 'package:flutter/foundation.dart';

import '../data/app_database.dart';
import '../models/plate_model.dart';
import 'plate_remote_service.dart';

class PlateRepository {
  final AppDatabase localDb;
  final PlateRemoteService remoteService;

  PlateRepository({
    required this.localDb,
    required this.remoteService,
  });

  Stream<List<PlateModel>> watchPlates() {
    return localDb.watchPlates();
  }

  Future<void> loadInitialData() async {
    await refreshFromRemote();
    await syncPendingPlates();
  }

  Future<void> addPlate({
    required String plate,
    required String description,
  }) async {
    final localPlate = PlateModel(
      plate: plate,
      description: description,
      completed: false,
      updatedAt: DateTime.now(),
      pendingSync: true,
    );

    final insertedPlate = await localDb.insertPlate(localPlate);

    try {
      await remoteService.upsertPlate(insertedPlate);
      if (insertedPlate.id != null) {
        await localDb.markAsSynced(insertedPlate.id!);
      }
    } catch (e) {
      debugPrint('Error syncing new plate to Firebase: $e');
    }
  }

  Future<void> togglePlate(PlateModel plate) async {
    if (plate.id == null) return;

    final isCompleting = !plate.completed;
    final newDescription = isCompleting ? 'Pagado' : plate.description;

    await localDb.toggleCompleted(
      id: plate.id!,
      completed: !plate.completed,
      newDescription: newDescription,
    );

    try {
      final updatedPlate = plate.copyWith(
        completed: !plate.completed,
        description: newDescription,
        updatedAt: DateTime.now(),
        pendingSync: true,
      );

      await remoteService.upsertPlate(updatedPlate);
      await localDb.markAsSynced(plate.id!);
    } catch (e) {
      debugPrint('Error syncing toggled plate to Firebase: $e');
    }
  }

  Future<void> refreshFromRemote() async {
    try {
      final remotePlates = await remoteService.fetchPlates();

      for (final plate in remotePlates) {
        await localDb.upsertFromRemote(plate);
      }
    } catch (e) {
      debugPrint('Error fetching plates from Firebase: $e');
    }
  }

  Future<void> syncPendingPlates() async {
    final pendingPlates = await localDb.getPendingPlates();

    for (final plate in pendingPlates) {
      try {
        await remoteService.upsertPlate(plate);
        if (plate.id != null) {
          await localDb.markAsSynced(plate.id!);
        }
      } catch (e) {
        debugPrint('Error sincronizando placa: $e');
      }
    }
  }
}