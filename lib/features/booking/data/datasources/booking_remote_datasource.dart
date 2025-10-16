import '../models/booking_model.dart';

abstract class BookingRemoteDataSource {
  Future<void> createBooking(BookingModel booking);
  Future<List<BookingModel>> getBookings({String? userId, String? staffId});
  Future<void> cancelBooking(String bookingId);
  Future<void> assignStaff(String bookingId, String staffId);
  Future<void> rescheduleBooking(String bookingId, DateTime newDateTime);
}
