import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final String id;
  final String customerId;
  final String serviceId;
  final String staffId;
  final DateTime dateTime;
  final int durationMinutes;
  final String status; // e.g., 'scheduled', 'completed', 'cancelled'

  const AppointmentEntity({
    required this.id,
    required this.customerId,
    required this.serviceId,
    required this.staffId,
    required this.dateTime,
    required this.durationMinutes,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        serviceId,
        staffId,
        dateTime,
        durationMinutes,
        status,
      ];
}
