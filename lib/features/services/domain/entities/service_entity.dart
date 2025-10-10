import 'package:equatable/equatable.dart';

class ServiceEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final int durationMinutes;

  const ServiceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationMinutes,
  });

  @override
  List<Object?> get props => [id, name, description, price, durationMinutes];
}
