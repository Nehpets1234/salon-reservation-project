import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/appointment_repository.dart';

class NotifyCustomerUseCase {
  final AppointmentRepository repository;

  NotifyCustomerUseCase(this.repository);

  Future<Either<Failure, bool>> call(String appointmentId, String message) async {
    return await repository.notifyCustomer(appointmentId, message);
  }
}
