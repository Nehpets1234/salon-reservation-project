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
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServiceEntity?>> getServiceDetail(String serviceId) async {
    try {
      final result = await remoteDataSource.getServiceDetail(serviceId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addService(ServiceEntity service) async {
    try {
      final model = ServiceModel(
        id: service.id,
        name: service.name,
        description: service.description,
        price: service.price,
        durationMinutes: service.durationMinutes,
      );
      await remoteDataSource.addService(model);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateService(ServiceEntity service) async {
    try {
      final model = ServiceModel(
        id: service.id,
        name: service.name,
        description: service.description,
        price: service.price,
        durationMinutes: service.durationMinutes,
      );
      await remoteDataSource.updateService(model);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteService(String serviceId) async {
    try {
      await remoteDataSource.deleteService(serviceId);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
