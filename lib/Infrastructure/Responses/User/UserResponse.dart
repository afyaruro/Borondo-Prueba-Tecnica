import 'package:prueba_tecnica/Domain/Models/User.dart';

class UserResponse {
  late String message;
  late bool isError;
  User? user; 

  // Constructor para casos exitosos
  UserResponse.success({required User userNew}) {
    this.message = "Usuario creado exitosamente";
    this.isError = false;
    this.user = userNew;
  }

  // Constructor para casos de error
  UserResponse.error({required String errorMessage}) {
    this.message = errorMessage;
    this.isError = true;
    this.user = null; 
  }
}
