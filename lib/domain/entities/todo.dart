

import 'package:equatable/equatable.dart';

class Todo extends Equatable{

  final String id;
  final String description;
  final DateTime? completedAt;

  const Todo({
    required this.id,
    required this.description,
    required this.completedAt,
  });

  bool get done {
    return completedAt != null; // true or false
  }

  @override
  List<Object?> get props => [id, description, completedAt];

}