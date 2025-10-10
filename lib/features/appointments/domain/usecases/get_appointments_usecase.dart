import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/appointment_entity.dart';

/// The AppointmentRepository defines the abstract contract for
/// all appointment-related operations in the domain layer.
/// Each method uses `Either<Failure, T>` to represent success (Right)
/// or failure (Left), following clean architecture best practices.
abstract class AppointmentRepository {
  /// Retrieves a list of appointments filtered by optional [customerId] or [staffId].
  Future<Either<Failure, List<AppointmentEntity>>> getAppointments({
    String? customerId,
    String? staffId,
  });

  /// Updates an existing appointment and returns the updated [AppointmentEntity].
  Future<Either<Failure, AppointmentEntity>> updateAppointment(
    AppointmentEntity appointment,
  );

  /// Cancels an appointment by [appointmentId].
  /// Returns `true` if successful, or a [Failure] on error.
  Future<Either<Failure, bool>> cancelAppointment(String appointmentId);

  /// Sends a notification to the customer about the appointment.
  /// Returns `true` if successful, or a [Failure] on error.
  Future<Either<Failure, bool>> notifyCustomer(
    String appointmentId,
    String message,
  );
}
