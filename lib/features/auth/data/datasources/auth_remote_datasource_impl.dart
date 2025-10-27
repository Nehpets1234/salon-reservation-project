import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;

      final userDoc = await firestore.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        throw Exception('User data not found');
      }

      return UserModel.fromFirebaseUser(uid, userDoc.data() ?? {});
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> register(
    String name,
    String email,
    String password, {
    String? phone,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = credential.user!.uid;

      final userData = {
        'id': uid,
        'name': name,
        'email': email,
        'phone': phone ?? '',
      };

      await firestore.collection('users').doc(uid).set(userData);

      return UserModel.fromMap(userData);
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> getUserProfile() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) throw Exception('No user logged in');

      final userDoc =
          await firestore.collection('users').doc(currentUser.uid).get();

      if (!userDoc.exists) {
        throw Exception('User profile not found');
      }

      return UserModel.fromFirebaseUser(currentUser.uid, userDoc.data() ?? {});
    } catch (e) {
      throw Exception('Fetching user profile failed: ${e.toString()}');
    }
  }

  @override
  Future<void> updateUserProfile(UserModel user) async {
    try {
      await firestore.collection('users').doc(user.id).update(user.toMap());
    } catch (e) {
      throw Exception('Updating user profile failed: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Logout failed: ${e.toString()}');
    }
  }
}
