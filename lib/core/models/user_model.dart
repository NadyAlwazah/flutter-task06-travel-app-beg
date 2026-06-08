class UserModel {
  final String id;
  final String fullName;
  final String email;

  UserModel({required this.id, required this.fullName, required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'fullName': fullName, 'email': email};
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String userId) {
    return UserModel(
      id: userId,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
    );
  }
}
