import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica/Domain/Models/User.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/User/CreateUser.dart';
import 'package:prueba_tecnica/Infrastructure/Repository/User/LoginUser.dart';
import 'package:prueba_tecnica/Infrastructure/Responses/User/UserResponse.dart';

class UserRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<String> addUser(User user, File image) async {
    return CreateUser.addUser(user, image, _usersCollection);
  }

  Future<UserResponse> login(String email, String password) async {
    return LoginUser.login(email, password, _usersCollection);
  }
}
