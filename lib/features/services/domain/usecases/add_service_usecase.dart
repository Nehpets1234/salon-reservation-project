import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/service_entity.dart';
import '../repositories/service_repository.dart';

class AddServiceUseCase {
  final ServiceRepository repository;

  AddServiceUseCase(this.repository);

  Future<Either<Failure, void>> call(ServiceEntity service) async {
    return await repository.addService(service);
  }
}
