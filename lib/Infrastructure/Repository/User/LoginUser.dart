import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica/Domain/Models/User.dart';
import 'package:prueba_tecnica/Infrastructure/Responses/User/UserResponse.dart';

class LoginUser {
  static Future<UserResponse> login(String email, String password,
      CollectionReference _usersCollection) async {
    try {
      // Consultar el usuario en Firestore
      final userDoc = await _usersCollection.doc(email).get();
      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;

        // Obtener la contraseña almacenada
        final storedPassword = userData['password'] as String;

        if (password == storedPassword) {
          // Convertir el documento de Firestore a un modelo de usuario
          return UserResponse.success(userNew: User.fromMap(userData));
        } else {
          print("Contraseña incorrecta");
          return UserResponse.error(errorMessage: "password incorrect");
        }
      } else {
        print("Usuario no encontrado");
        return UserResponse.error(errorMessage: "not exist");
      }
    } catch (e) {
      print("Error al iniciar sesión: $e");
      return UserResponse.error(errorMessage: "error");
    }
  }
}
