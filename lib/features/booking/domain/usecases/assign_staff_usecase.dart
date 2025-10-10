import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/booking_repository.dart';

class AssignStaffUseCase {
  final BookingRepository repository;

  AssignStaffUseCase(this.repository);

  Future<Either<Failure, void>> call(String bookingId, String staffId) async {
    try {
      await repository.assignStaff(bookingId, staffId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
