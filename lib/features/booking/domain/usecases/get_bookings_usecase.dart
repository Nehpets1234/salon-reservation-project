import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/booking_entity.dart';
import '../repositories/booking_repository.dart';

class GetBookingsUseCase {
  final BookingRepository repository;

  GetBookingsUseCase(this.repository);

  Future<Either<Failure, List<BookingEntity>>> call({
    String? userId,
    String? staffId,
  }) async {
    try {
      final bookings = await repository.getBookings(
        userId: userId,
        staffId: staffId,
      );
      return Right(bookings);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
