import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/domain/usecases/add_marker_point.dart';

abstract class MarkersRepositoryI {
  Future<Either<Failure, List<MarkerPoint>>> getMarkerPoints();
  Future<Either<Failure, List<MarkerType>>> getMarkerTypes();
  Future<Either<Failure, void>> addMarkerPoint(AddMarkerPointParameters parameters);
}