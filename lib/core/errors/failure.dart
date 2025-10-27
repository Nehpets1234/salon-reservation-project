import 'package:equatable/equatable.dart';

/// Base class representing different types of failures across the app.
/// Used with Either<Failure, T> for clean error handling.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// General server or API failure.
class ServerFailure extends Failure {
  const ServerFailure([String message = "Server Failure"]) : super(message);
}

/// Local cache or storage failure.
class CacheFailure extends Failure {
  const CacheFailure([String message = "Cache Failure"]) : super(message);
}

/// Authentication-related failure.
class AuthFailure extends Failure {
  const AuthFailure([String message = "Authentication Failure"]) : super(message);
}

/// Firebase-specific failure.
class FirebaseFailure extends Failure {
  const FirebaseFailure([String message = "Firebase Failure"]) : super(message);
}

/// Unexpected or unknown error.
class UnknownFailure extends Failure {
  const UnknownFailure([String message = "Unknown Failure"]) : super(message);
}



