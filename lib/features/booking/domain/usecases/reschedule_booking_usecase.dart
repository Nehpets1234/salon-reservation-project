import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/booking_repository.dart';

class RescheduleBookingUseCase {
  final BookingRepository repository;

  RescheduleBookingUseCase(this.repository);

  Future<Either<Failure, void>> call(String bookingId, DateTime newDateTime) async {
    try {
      await repository.rescheduleBooking(bookingId, newDateTime);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
