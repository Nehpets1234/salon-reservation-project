import '../entities/booking_entity.dart';

abstract class BookingRepository {
  Future<void> createBooking(BookingEntity booking);
  Future<List<BookingEntity>> getBookings({String? userId, String? staffId});
  Future<void> cancelBooking(String bookingId);
  Future<void> assignStaff(String bookingId, String staffId);
  Future<void> rescheduleBooking(String bookingId, DateTime newDateTime);
}