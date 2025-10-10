import 'package:dartz/dartz.dart';
import 'package:project_salon/core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);

  Future<Either<Failure, UserEntity>> register(
    String name,
    String email,
    String password, {
    String? phone,
  });

  Future<Either<Failure, UserEntity>> getUserProfile();

  Future<Either<Failure, void>> updateUserProfile(UserEntity user);

  Future<Either<Failure, void>> logout();
}
