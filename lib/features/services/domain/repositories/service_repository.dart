import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/service_entity.dart';

abstract class ServiceRepository {
  Future<Either<Failure, List<ServiceEntity>>> getServices();
  Future<Either<Failure, ServiceEntity>> getServiceDetail(String serviceId);
  Future<Either<Failure, Unit>> addService(ServiceEntity service);
  Future<Either<Failure, Unit>> updateService(ServiceEntity service);
  Future<Either<Failure, Unit>> deleteService(String serviceId);
}
