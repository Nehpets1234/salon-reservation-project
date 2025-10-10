import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/appointment_entity.dart';

abstract class AppointmentRepository {
  /// Retrieves all appointments based on optional filters (customer or staff).
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments({
    String? customerId,
    String? staffId,
  });

  /// Updates an existing appointment and returns the updated entity.
  Future<Either<Failure, AppointmentEntity>> updateAppointment(
    AppointmentEntity appointment,
  );

  /// Cancels an appointment by its ID.
  Future<Either<Failure, bool>> cancelAppointment(String appointmentId);

  /// Notifies a customer (e.g., via email, SMS, or push notification).
  Future<Either<Failure, bool>> notifyCustomer(
    String appointmentId,
    String message,
  );
}
