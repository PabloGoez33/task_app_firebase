import 'package:flutter/material.dart';

import '../models/plate_model.dart';

class PlateTile extends StatelessWidget {
  final PlateModel plate;
  final VoidCallback onToggle;

  const PlateTile({
    super.key,
    required this.plate,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: plate.completed,
          onChanged: plate.completed ? null : (_) => onToggle(),
        ),
        title: Text(
          plate.plate,
          style: TextStyle(
            decoration: plate.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plate.description,
              style: TextStyle(
                fontStyle: plate.completed ? FontStyle.italic : FontStyle.normal,
                color: plate.completed ? Colors.grey : null,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  'Actualizada: ${plate.updatedAt.toLocal()}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(width: 8),
                if (plate.pendingSync)
                  const Chip(
                    label: Text('Sync pendiente'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}