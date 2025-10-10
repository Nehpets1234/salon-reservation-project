import 'package:dartz/dartz.dart';
import 'package:project_salon/core/errors/failure.dart'; // adjust path if needed
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class GetUserProfileUseCase {
  final AuthRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getUserProfile();
  }
}
