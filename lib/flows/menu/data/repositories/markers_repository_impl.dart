import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/data/datasources/markers_datasource.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackint/flows/menu/domain/repositories/markers_repository.dart';
import 'package:hackint/flows/menu/domain/usecases/add_marker_point.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MarkersRepositoryI)
class MarkersRepositoryImpl implements MarkersRepositoryI {
  final MarkersDataSourceI dataSource;

  MarkersRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<MarkerPoint>>> getMarkerPoints() async {
    try {
      final result = await dataSource.getMarkerPoints();
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<MarkerType>>> getMarkerTypes() async {
    try {
      final result = await dataSource.getMarkerTypes();
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addMarkerPoint(
      AddMarkerPointParameters parameters) async {
    try {
      final result = await dataSource.addMarkerPoint(
        name: parameters.name,
        description: parameters.description,
        typeId: parameters.typeId,
        lat: parameters.lat,
        lon: parameters.lon,
      );
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }
}
