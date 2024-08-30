import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba_tecnica/Domain/Models/User.dart';

class CreateUser {

  static Future<String> addUser(User user, File image, CollectionReference _usersCollection) async {
    try {
      final userDoc = await _usersCollection.doc(user.emailUser).get();
      if (userDoc.exists) {
        print("El usuario ya existe");
        return "exist";
      }

      // Subir la imagen a Firebase Storage
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef.child('user_images/${user.emailUser}.jpg');
      final uploadTask = imagesRef.putFile(image);
      final snapshot = await uploadTask.whenComplete(() => {});
      final imageUrl = await snapshot.ref.getDownloadURL();

      // Actualizar la URL de la imagen en el usuario
      user.imagenUser = imageUrl;

      // Guardar el usuario en Firestore
      await _usersCollection.doc(user.emailUser).set(user.toMap());

      print("Usuario agregado exitosamente");
      return "create";
    } catch (e) {
      print("Error al agregar usuario: $e");
      return "error";
    }
  }


}
