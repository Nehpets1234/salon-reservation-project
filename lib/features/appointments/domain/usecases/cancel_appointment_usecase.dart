import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/appointment_repository.dart';

class CancelAppointmentUseCase {
  final AppointmentRepository repository;

  CancelAppointmentUseCase(this.repository);

  Future<Either<Failure, bool>> call(String appointmentId) {
    return repository.cancelAppointment(appointmentId);
  }
}
