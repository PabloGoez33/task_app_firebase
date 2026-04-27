import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/plate_model.dart';

class PlateRemoteService {
  final CollectionReference<Map<String, dynamic>> _platesRef =
      FirebaseFirestore.instance.collection('plates');

  Future<void> upsertPlate(PlateModel plate) async {
    if (plate.id == null) return;

    await _platesRef.doc(plate.id.toString()).set(plate.toFirestore());
  }

  Future<List<PlateModel>> fetchPlates() async {
    final snapshot = await _platesRef.get();

    return snapshot.docs.map((doc) {
      return PlateModel.fromFirestore(
        doc.data(),
        id: int.parse(doc.id),
      );
    }).toList();
  }
}