import 'package:hackint/domain/shared_models/api/marker_type.dart';

class MarkerPoint {
  const MarkerPoint({
    this.id = '',
    required this.name,
    required this.description,
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  final String id;
  final String name;
  final String description;
  final MarkerType type;
  final double latitude;
  final double longitude;

  MarkerPoint copyWith({
    String? id,
    String? name,
    String? description,
    MarkerType? type,
    double? latitude,
    double? longitude,
  }) {
    return MarkerPoint(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
