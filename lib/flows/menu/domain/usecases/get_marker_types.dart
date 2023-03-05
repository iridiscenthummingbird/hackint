import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/domain/shared_models/api/marker_type.dart';
import 'package:hackint/flows/menu/domain/repositories/markers_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMarkerTypesUseCase implements UseCase<List<MarkerType>, NoParams> {
  final MarkersRepositoryI repository;
  
  GetMarkerTypesUseCase(this.repository);

  @override
  Future<Either<Failure, List<MarkerType>>> call(NoParams params) async {
    return await repository.getMarkerTypes();
  }
}
