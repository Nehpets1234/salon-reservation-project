import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../repositories/appointment_repository.dart'; // ✅ Corrected import

class NotifyAdminUseCase {
  final AppointmentRepository repository;

  NotifyAdminUseCase(this.repository);

  Future<Either<Failure, bool>> call(String message) async {
    try {
      return await repository.notifyAdmin(message);
    } catch (e) {
      return Left(ServerFailure('Failed to notify admin: $e'));
    }
  }
}
