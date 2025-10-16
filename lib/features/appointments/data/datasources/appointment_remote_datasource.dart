import '../models/appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments({
    String? customerId,
    String? staffId,
  });

  Future<AppointmentModel> updateAppointment(AppointmentModel appointment);

  Future<bool> cancelAppointment(String appointmentId);

  Future<bool> notifyCustomer(String appointmentId, String message);
}
