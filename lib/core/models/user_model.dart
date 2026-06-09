class UserModel {
  final String id;
  final String fullName;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? location;
  final String? phoneNumber;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.firstName,
    this.lastName,
    this.location,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'location': location,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String userId) {
    return UserModel(
      id: userId,
      fullName: map['fullName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? "",
      location: map['location'] ?? "",
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }
}
