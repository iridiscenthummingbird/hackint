import 'package:flutter/material.dart';
import 'package:hackint/flows/menu/presentation/pages/map/enums/markers_icons.dart';

class MarkerType {
  const MarkerType({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  final String id;
  final String name;
  final Color color;
  final MarkersIcons icon;
}
