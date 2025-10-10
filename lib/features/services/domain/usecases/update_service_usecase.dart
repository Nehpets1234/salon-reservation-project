import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/service_entity.dart';
import '../repositories/service_repository.dart';

class UpdateServiceUseCase {
  final ServiceRepository repository;

  UpdateServiceUseCase(this.repository);

  Future<Either<Failure, Unit>> call(ServiceEntity service) async {
    return await repository.updateService(service);
  }
}
