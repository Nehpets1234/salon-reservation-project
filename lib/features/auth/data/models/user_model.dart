import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.phone,
  });

  /// Convert Firestore document to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
    );
  }

  /// Convert Firebase User + Firestore doc
  factory UserModel.fromFirebaseUser(String uid, Map<String, dynamic> map) {
    return UserModel(
      id: uid,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'],
    );
  }

  /// Convert UserModel to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
