import 'package:dartz/dartz.dart';
import 'package:project_salon/core/errors/failure.dart'; // adjust this import path if needed
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class UpdateUserProfileUseCase {
  final AuthRepository repository;

  UpdateUserProfileUseCase(this.repository);

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repository.updateUserProfile(user);
  }
}
