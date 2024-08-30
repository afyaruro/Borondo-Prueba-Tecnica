// user_model.dart

class User {
  final String nameUser;
  final String emailUser;
  final String phoneUser;
  final String nationalityUser;
  final String birthdayDateUser;
  final String passwordUser;
  late String imagenUser;

  User({
    required this.imagenUser,
    required this.nameUser,
    required this.emailUser,
    required this.phoneUser,
    required this.nationalityUser,
    required this.birthdayDateUser,
    required this.passwordUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nameUser,
      'email': emailUser,
      'phone': phoneUser,
      'nationality': nationalityUser,
      'birthdayDate': nationalityUser,
      'password': passwordUser,
      'imagen': imagenUser
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nameUser: map['name'] ?? '',
      emailUser: map['email'] ?? '',
      passwordUser: map['password'] ?? '',
      phoneUser: map['phone'] ?? '',
      birthdayDateUser: map['birthdayDate'] ?? '',
      nationalityUser: map['nationality'] ?? '',
      imagenUser: map['imagen'] ?? '',

      // createdAt: (map['created_at'] as Timestamp?)?.toDate(),
    );
  }
}
