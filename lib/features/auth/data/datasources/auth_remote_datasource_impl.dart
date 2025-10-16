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
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;

    final userDoc = await firestore.collection('users').doc(uid).get();
    return UserModel.fromFirebaseUser(uid, userDoc.data() ?? {});
  }

  @override
  Future<UserModel> register(String name, String email, String password, {String? phone}) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uid = credential.user!.uid;

    final userData = {
      'id': uid,
      'name': name,
      'email': email,
      'phone': phone,
    };

    await firestore.collection('users').doc(uid).set(userData);

    return UserModel.fromMap(userData);
  }

  @override
  Future<UserModel> getUserProfile() async {
    final currentUser = firebaseAuth.currentUser;
    if (currentUser == null) throw Exception('No user logged in');

    final userDoc = await firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromFirebaseUser(currentUser.uid, userDoc.data() ?? {});
  }

  @override
  Future<void> updateUserProfile(UserModel user) async {
    await firestore.collection('users').doc(user.id).update(user.toMap());
  }
}
