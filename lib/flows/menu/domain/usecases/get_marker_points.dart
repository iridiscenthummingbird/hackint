import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/flows/menu/domain/enittities/marker_point.dart';
import 'package:hackint/flows/menu/domain/repositories/markers_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMarkerPointsUseCase implements UseCase<List<MarkerPoint>, NoParams> {
  final MarkersRepositoryI repository;
  GetMarkerPointsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MarkerPoint>>> call(NoParams params) async {
    return await repository.getMarkerPoints();
  }
}
