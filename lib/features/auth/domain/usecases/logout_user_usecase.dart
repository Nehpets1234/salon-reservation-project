import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class LogoutUserUseCase {
  final AuthRepository repository;

  LogoutUserUseCase(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
