import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/repositories/service_repository.dart';
import '../datasources/service_remote_datasource.dart';
import '../models/service_model.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  ServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices() async {
    try {
      final result = await remoteDataSource.getServices();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch services: $e'));
    }
  }

  @override
  Future<Either<Failure, ServiceEntity>> getServiceDetail(String serviceId) async {
    try {
      final result = await remoteDataSource.getServiceDetail(serviceId);
      return Right(result as ServiceEntity);
    } catch (e) {
      return Left(ServerFailure('Failed to get service detail: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> addService(ServiceEntity service) async {
    try {
      final model = ServiceModel(
        id: service.id,
        name: service.name,
        description: service.description,
        price: service.price,
        durationMinutes: service.durationMinutes,
      );
      await remoteDataSource.addService(model);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to add service: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateService(ServiceEntity service) async {
    try {
      final model = ServiceModel(
        id: service.id,
        name: service.name,
        description: service.description,
        price: service.price,
        durationMinutes: service.durationMinutes,
      );
      await remoteDataSource.updateService(model);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to update service: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteService(String serviceId) async {
    try {
      await remoteDataSource.deleteService(serviceId);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to delete service: $e'));
    }
  }
}
