import 'package:flutter/material.dart';

import '../models/plate_model.dart';
import '../services/plate_repository.dart';
import '../widgets/plate_form_dialog.dart';
import '../widgets/plate_tile.dart';

class PlatesPage extends StatefulWidget {
  final PlateRepository repository;

  const PlatesPage({
    super.key,
    required this.repository,
  });

  @override
  State<PlatesPage> createState() => _PlatesPageState();
}

class _PlatesPageState extends State<PlatesPage> {
  late final Stream<List<PlateModel>> _platesStream;

  @override
  void initState() {
    super.initState();
    _platesStream = widget.repository.watchPlates();
    widget.repository.loadInitialData();
  }

  Future<void> _addPlate() async {
    final result = await showDialog<PlateFormResult>(
      context: context,
      builder: (_) => const PlateFormDialog(),
    );

    if (result == null) return;

    await widget.repository.addPlate(
      plate: result.plate,
      description: result.description,
    );
  }

  Future<void> _togglePlate(PlateModel plate) async {
    await widget.repository.togglePlate(plate);
  }

  Future<void> _refresh() async {
    await widget.repository.refreshFromRemote();
    await widget.repository.syncPendingPlates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plate App Firebase'),
      ),
      body: StreamBuilder<List<PlateModel>>(
        stream: _platesStream,
        builder: (context, snapshot) {
          final plates = snapshot.data ?? const [];

          if (snapshot.connectionState == ConnectionState.waiting && plates.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (plates.isEmpty) {
            return const Center(
              child: Text('No hay placas registradas'),
            );
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: plates.length,
              itemBuilder: (context, index) {
                final plate = plates[index];

                return PlateTile(
                  plate: plate,
                  onToggle: () => _togglePlate(plate),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPlate,
        child: const Icon(Icons.add),
      ),
    );
  }
}