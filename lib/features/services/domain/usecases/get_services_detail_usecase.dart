import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/service_entity.dart';
import '../repositories/service_repository.dart';

class GetServiceDetailUseCase {
  final ServiceRepository repository;

  GetServiceDetailUseCase(this.repository);

  Future<Either<Failure, ServiceEntity>> call(String serviceId) async {
    return await repository.getServiceDetail(serviceId);
  }
}
