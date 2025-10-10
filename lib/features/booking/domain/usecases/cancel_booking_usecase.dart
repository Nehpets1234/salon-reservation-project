import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/booking_repository.dart';

class CancelBookingUseCase {
  final BookingRepository repository;

  CancelBookingUseCase(this.repository);

  Future<Either<Failure, void>> call(String bookingId) async {
    try {
      await repository.cancelBooking(bookingId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
