import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/appointment_entity.dart';

abstract class AppointmentRepository {
  /// Get all appointments for a specific customer or staff (optional filters)
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments({
    String? customerId,
    String? staffId,
  });

  /// Update an appointment’s details
  Future<Either<Failure, AppointmentEntity>> updateAppointment(
    AppointmentEntity appointment,
  );

  /// Cancel a specific appointment by ID
  Future<Either<Failure, bool>> cancelAppointment(String appointmentId);

  /// Notify the customer about an appointment (e.g., reminder, status update)
  Future<Either<Failure, bool>> notifyCustomer(
    String appointmentId,
    String message,
  );
}
