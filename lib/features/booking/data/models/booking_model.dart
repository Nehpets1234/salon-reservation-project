import '../../domain/entities/booking_entity.dart';

class BookingModel extends BookingEntity {
  const BookingModel({
    required super.id,
    required super.userId,
    required super.serviceId,
    required super.staffId,
    required super.dateTime,
    required super.durationMinutes,
    required super.status,
  });

  factory BookingModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BookingModel(
      id: documentId,
      userId: map['userId'] ?? '',
      serviceId: map['serviceId'] ?? '',
      staffId: map['staffId'] ?? '',
      dateTime: (map['dateTime'] as Timestamp).toDate(),
      durationMinutes: map['durationMinutes'] ?? 0,
      status: map['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'serviceId': serviceId,
      'staffId': staffId,
      'dateTime': dateTime,
      'durationMinutes': durationMinutes,
      'status': status,
    };
  }
}
