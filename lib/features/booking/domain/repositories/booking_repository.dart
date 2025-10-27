import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/booking_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, Unit>> createBooking(BookingEntity booking);
  Future<Either<Failure, List<BookingEntity>>> getBookings({String? userId, String? staffId});
  Future<Either<Failure, Unit>> cancelBooking(String bookingId);
  Future<Either<Failure, Unit>> assignStaff(String bookingId, String staffId);
  Future<Either<Failure, Unit>> rescheduleBooking(String bookingId, DateTime newDateTime);
}
