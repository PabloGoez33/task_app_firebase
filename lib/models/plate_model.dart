class PlateModel {
  final int? id;
  final String plate;
  final String description;
  final bool completed;
  final DateTime updatedAt;
  final bool pendingSync;

  const PlateModel({
    this.id,
    required this.plate,
    required this.description,
    required this.completed,
    required this.updatedAt,
    required this.pendingSync,
  });

  PlateModel copyWith({
    int? id,
    String? plate,
    String? description,
    bool? completed,
    DateTime? updatedAt,
    bool? pendingSync,
  }) {
    return PlateModel(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      updatedAt: updatedAt ?? this.updatedAt,
      pendingSync: pendingSync ?? this.pendingSync,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'plate': plate,
      'description': description,
      'completed': completed,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory PlateModel.fromFirestore(Map<String, dynamic> map, {required int id}) {
    return PlateModel(
      id: id,
      plate: map['plate'] as String? ?? '',
      description: map['description'] as String? ?? '',
      completed: map['completed'] as bool? ?? false,
      updatedAt: DateTime.tryParse(map['updatedAt'] as String? ?? '') ?? DateTime.now(),
      pendingSync: map['pendingSync'] as bool? ?? false,
    );
  }
}