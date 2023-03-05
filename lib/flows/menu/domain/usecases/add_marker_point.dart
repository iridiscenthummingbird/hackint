import 'package:dartz/dartz.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/domain/core/usecase/usecase.dart';
import 'package:hackint/flows/menu/domain/repositories/markers_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddMarkerPointUseCase implements UseCase<void, AddMarkerPointParameters> {
  final MarkersRepositoryI repository;
  
  AddMarkerPointUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddMarkerPointParameters params) async {
    return await repository.addMarkerPoint(params);
  }
}

class AddMarkerPointParameters {
  const AddMarkerPointParameters({
    required this.name,
    required this.description,
    required this.typeId,
    required this.lat,
    required this.lon,
  });

  final String name;
  final String description;
  final String typeId;
  final double lat;
  final double lon;
}
