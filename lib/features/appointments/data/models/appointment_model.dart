import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.id,
    required super.customerId,
    required super.serviceId,
    required super.staffId,
    required super.dateTime,
    required super.durationMinutes,
    required super.status,
  });

  factory AppointmentModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AppointmentModel(
      id: documentId,
      customerId: map['customerId'] ?? '',
      serviceId: map['serviceId'] ?? '',
      staffId: map['staffId'] ?? '',
      dateTime: (map['dateTime'] as Timestamp).toDate(),
      durationMinutes: map['durationMinutes'] ?? 0,
      status: map['status'] ?? 'scheduled',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'serviceId': serviceId,
      'staffId': staffId,
      'dateTime': dateTime,
      'durationMinutes': durationMinutes,
      'status': status,
    };
  }
}
