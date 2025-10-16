import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import '../datasources/booking_remote_datasource.dart';
import '../models/booking_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, bool>> createBooking(BookingEntity booking) async {
    try {
      final model = BookingModel(
        id: booking.id,
        userId: booking.userId,
        serviceId: booking.serviceId,
        staffId: booking.staffId,
        dateTime: booking.dateTime,
        durationMinutes: booking.durationMinutes,
        status: booking.status,
      );
      await remoteDataSource.createBooking(model);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to create booking: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getBookings({
    String? userId,
    String? staffId,
  }) async {
    try {
      final result = await remoteDataSource.getBookings(
        userId: userId,
        staffId: staffId,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch bookings: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> cancelBooking(String bookingId) async {
    try {
      await remoteDataSource.cancelBooking(bookingId);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel booking: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> assignStaff(String bookingId, String staffId) async {
    try {
      await remoteDataSource.assignStaff(bookingId, staffId);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to assign staff: $e'));
    }
  }

  @override
  Future<Either<Failure, bool>> rescheduleBooking(String bookingId, DateTime newDateTime) async {
    try {
      await remoteDataSource.rescheduleBooking(bookingId, newDateTime);
      return const Right(true);
    } catch (e) {
      return Left(ServerFailure('Failed to reschedule booking: $e'));
    }
  }
}
