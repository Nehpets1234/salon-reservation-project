import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/service_repository.dart';

class DeleteServiceUseCase {
  final ServiceRepository repository;

  DeleteServiceUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String serviceId) async {
    return await repository.deleteService(serviceId);
  }
}
