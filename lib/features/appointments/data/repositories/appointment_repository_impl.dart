import 'package:dartz/dartz.dart';
import '../../domain/entities/appointment_entity.dart';
import '../../domain/repositories/appointment_repository.dart';
import '../datasources/appointment_remote_datasource.dart';
import '../models/appointment_model.dart';
import '../../../../core/errors/failure.dart'; 


class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;

  AppointmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments({
    String? customerId,
    String? staffId,
  }) async {
    try {
      final result = await remoteDataSource.getAppointments(
        customerId: customerId,
        staffId: staffId,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to get appointments: $e'));
    }
  }

  @override
  Future<Either<Failure, AppointmentEntity>> updateAppointment(
      AppointmentEntity appointment) async {
    try {
      final model = AppointmentModel(
        id: appointment.id,
        customerId: appointment.customerId,
        serviceId: appointment.serviceId,
        staffId: appointment.staffId,
        dateTime: appointment.dateTime,
        durationMinutes: appointment.durationMinutes,
        status: appointment.status,
      );

      final updated = await remoteDataSource.updateAppointment(model);
      return Right(updated);
    } catch (e) {
      return Left(ServerFailure('Failed to update appointment: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelAppointment(String appointmentId) async {
    try {
      final result = await remoteDataSource.cancelAppointment(appointmentId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel appointment: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> notifyCustomer(
      String appointmentId, String message) async {
    try {
      final result =
          await remoteDataSource.notifyCustomer(appointmentId, message);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to notify customer: $e'));
    }
  } 

   /// ✅ IMPLEMENTATION ADDED HERE
  @override
  Future<Either<Failure, bool>> notifyAdmin(String message) async {
    try {
      final result = await remoteDataSource.notifyAdmin(message);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to notify admin: $e'));
    }
  }
}
