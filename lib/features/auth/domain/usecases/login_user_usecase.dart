import 'package:dartz/dartz.dart';
import 'package:project_salon/core/errors/failure.dart'; // adjust the import path if needed
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUserUseCase {
  final AuthRepository repository;

  LoginUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
