import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba_tecnica/Domain/Services/User/UserServices.dart';
import 'package:prueba_tecnica/Ui/Components/CustomButton.dart';
import 'package:prueba_tecnica/Ui/Components/CustomDatePicker.dart';
import 'package:prueba_tecnica/Ui/Components/CustomDropdown..dart';
import 'package:prueba_tecnica/Ui/Components/CustomHeader.dart';
import 'package:prueba_tecnica/Ui/Components/CustomTextField.dart';
import 'package:prueba_tecnica/Ui/Pages/Created%20Account/widgets/WidgetHaveAccount.dart';
import 'package:prueba_tecnica/Ui/Pages/Created%20Account/widgets/WidgetTextImage.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final UserServices _userServices = UserServices();
  final TextEditingController controllerName = TextEditingController(text: "");
  final TextEditingController controllerEmail = TextEditingController(text: "");
  final TextEditingController controllerPhone = TextEditingController(text: "");
  final TextEditingController controllerNacionality =
      TextEditingController(text: "");
  final TextEditingController controllerPassword =
      TextEditingController(text: "");
  final TextEditingController controllerBirday =
      TextEditingController(text: "");

  var _image;
  ImagePicker picker = ImagePicker();

  _camGaleria(bool op) async {
    XFile? image;
    image = op
        ? await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        : await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Imagen de Galeria'),
                    onTap: () {
                      _camGaleria(false);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Capturar Imagen'),
                  onTap: () {
                    _camGaleria(true);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeader(
                gradient: true,
                height: 180,
              ),
              
              WidgetTextImage(
                image: _image, // Pasas tu imagen aquí
                onCameraPressed: () {
                  _opcioncamara(context); // Pasas tu función aquí
                },
              ),

              CustomTextField(
                controller: controllerName,
                text: "Name",
                icon: Icons.person_outline_outlined,
              ),
              
              const SizedBox(
                height: 5,
              ),

              CustomTextField(
                controller: controllerEmail,
                text: "Email",
                icon: Icons.email_outlined,
              ),

              const SizedBox(
                height: 5,
              ),

              CustomTextField(
                controller: controllerPhone,
                text: "Phone",
                icon: Icons.phone_enabled_outlined,
              ),

              const SizedBox(
                height: 5,
              ),

              CustomDropdown(
                icon: Icons.location_on_outlined,
                text: 'Nacionality',
                items: const [
                  'Colombia',
                  'Peru',
                  'Mexico',
                  'Brazil',
                  'Argentina'
                ],
                onChanged: (String? value) {
                  if (value == null) {
                  } else {
                    controllerNacionality.text = value;
                    // print('Selected country: $value');
                  }
                },
              ),

              const SizedBox(
                height: 5,
              ),

              CustomDatePicker(
                icon: Icons.calendar_month,
                text: 'Birthday date',
                onDateChanged: (String date) {
                  controllerBirday.text = date;
                  // print('Selected date: $date');
                },
              ),

              const SizedBox(
                height: 5,
              ),

              CustomTextField(
                controller: controllerPassword,
                text: "Password",
                isPassword: true,
                icon: Icons.lock_outline,
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                colorText: Colors.black,
                text: "Create Account",
                function: () {
                  _userServices.createUser(
                      image: _image,
                      birday: controllerBirday.text,
                      context: context,
                      name: controllerName.text,
                      email: controllerEmail.text,
                      nationality: controllerNacionality.text,
                      phone: controllerPhone.text,
                      password: controllerPassword.text);
                },
                color: const Color(0xff00d0c1),
              ),

              const SizedBox(
                height: 40,
              ),

              const WidgetHaveAccount(),

              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

