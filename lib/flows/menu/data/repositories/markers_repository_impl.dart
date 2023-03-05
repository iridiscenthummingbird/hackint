import 'package:hackint/flows/menu/data/datasources/markers_datasource.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackint/flows/menu/domain/repositories/markers_repository.dart';
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
}
