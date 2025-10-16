import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password, {String? phone});
  Future<UserModel> getUserProfile();
  Future<void> updateUserProfile(UserModel user);
}
