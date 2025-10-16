import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/booking_model.dart';
import 'booking_remote_datasource.dart';

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final FirebaseFirestore firestore;

  BookingRemoteDataSourceImpl(this.firestore);

  CollectionReference get _bookingCollection =>
      firestore.collection('bookings');

  @override
  Future<void> createBooking(BookingModel booking) async {
    await _bookingCollection.add(booking.toMap());
  }

  @override
  Future<List<BookingModel>> getBookings({String? userId, String? staffId}) async {
    Query query = _bookingCollection;

    if (userId != null) {
      query = query.where('userId', isEqualTo: userId);
    }
    if (staffId != null) {
      query = query.where('staffId', isEqualTo: staffId);
    }

    final snapshot = await query.get();
    return snapshot.docs
        .map((doc) => BookingModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  @override
  Future<void> cancelBooking(String bookingId) async {
    await _bookingCollection.doc(bookingId).update({'status': 'cancelled'});
  }

  @override
  Future<void> assignStaff(String bookingId, String staffId) async {
    await _bookingCollection.doc(bookingId).update({'staffId': staffId});
  }

  @override
  Future<void> rescheduleBooking(String bookingId, DateTime newDateTime) async {
    await _bookingCollection.doc(bookingId).update({'dateTime': newDateTime});
  }
}
