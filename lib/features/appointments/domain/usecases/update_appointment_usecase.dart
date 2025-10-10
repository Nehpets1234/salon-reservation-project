import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/appointment_entity.dart';
import '../repositories/appointment_repository.dart';

class UpdateAppointmentUseCase {
  final AppointmentRepository repository;

  UpdateAppointmentUseCase(this.repository);

  /// Updates an existing appointment and returns either:
  /// - [Right(AppointmentEntity)] if successful
  /// - [Left(Failure)] if an error occurs
  Future<Either<Failure, AppointmentEntity>> call(AppointmentEntity appointment) async {
    return await repository.updateAppointment(appointment);
  }
}
