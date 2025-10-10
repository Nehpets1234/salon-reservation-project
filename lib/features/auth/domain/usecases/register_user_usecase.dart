import 'package:dartz/dartz.dart';
import 'package:project_salon/core/errors/failure.dart'; // adjust the import path if needed
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUserUseCase {
  final AuthRepository repository;

  RegisterUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call(
    String name,
    String email,
    String password, {
    String? phone,
  }) async {
    return await repository.register(name, email, password, phone: phone);
  }
}
