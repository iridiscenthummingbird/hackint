import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';

abstract class MarkersRepositoryI {
  Future<Either<Failure, List<MarkerPoint>>> getMarkerPoints();
}