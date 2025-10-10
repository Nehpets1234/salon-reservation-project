import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/service_entity.dart';
import '../repositories/service_repository.dart';

class GetServicesUseCase {
  final ServiceRepository repository;

  GetServicesUseCase(this.repository);

  Future<Either<Failure, List<ServiceEntity>>> call() async {
    return await repository.getServices();
  }
}
