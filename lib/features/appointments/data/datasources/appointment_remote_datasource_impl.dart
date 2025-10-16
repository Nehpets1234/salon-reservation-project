import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';
import 'appointment_remote_datasource.dart';

class AppointmentRemoteDataSourceImpl implements AppointmentRemoteDataSource {
  final FirebaseFirestore firestore;

  AppointmentRemoteDataSourceImpl(this.firestore);

  CollectionReference get _appointments =>
      firestore.collection('appointments');

  @override
  Future<List<AppointmentModel>> getAppointments({
    String? customerId,
    String? staffId,
  }) async {
    Query query = _appointments;

    if (customerId != null) {
      query = query.where('customerId', isEqualTo: customerId);
    }
    if (staffId != null) {
      query = query.where('staffId', isEqualTo: staffId);
    }

    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => AppointmentModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  @override
  Future<AppointmentModel> updateAppointment(AppointmentModel appointment) async {
    await _appointments.doc(appointment.id).update(appointment.toMap());
    return appointment;
  }

  @override
  Future<bool> cancelAppointment(String appointmentId) async {
    await _appointments.doc(appointmentId).update({'status': 'cancelled'});
    return true;
  }

  @override
  Future<bool> notifyCustomer(String appointmentId, String message) async {
    // Normally, you’d use Firebase Cloud Messaging (FCM) or store notifications.
    await _appointments.doc(appointmentId).collection('notifications').add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
    return true;
  }
}
