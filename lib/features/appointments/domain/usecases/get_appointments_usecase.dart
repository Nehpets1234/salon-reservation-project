import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/appointment_entity.dart';
import '../repositories/appointment_repository.dart';

class GetAppointmentsUseCase {
  final AppointmentRepository repository;

  GetAppointmentsUseCase(this.repository);

  Future<Either<Failure, List<AppointmentEntity>>> call({
    String? customerId,
    String? staffId,
  }) {
    return repository.getAppointments(customerId: customerId, staffId: staffId);
  }
}
