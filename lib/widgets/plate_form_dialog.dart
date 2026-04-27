import 'package:flutter/material.dart';

class PlateFormResult {
  final String plate;
  final String description;

  const PlateFormResult({
    required this.plate,
    required this.description,
  });
}

class PlateFormDialog extends StatefulWidget {
  const PlateFormDialog({super.key});

  @override
  State<PlateFormDialog> createState() => _PlateFormDialogState();
}

class _PlateFormDialogState extends State<PlateFormDialog> {
  final _plateController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _plateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pop(
      context,
      PlateFormResult(
        plate: _plateController.text.trim(),
        description: _descriptionController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nueva placa'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _plateController,
              decoration: const InputDecoration(
                labelText: 'Placa',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Ingrese una placa';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}