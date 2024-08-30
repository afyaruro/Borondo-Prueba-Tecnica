import 'package:flutter/material.dart';
import 'package:prueba_tecnica/Domain/Services/User/UserServices.dart';
import 'package:prueba_tecnica/Ui/Components/CustomButton.dart';
import 'package:prueba_tecnica/Ui/Components/CustomHeader.dart';
import 'package:prueba_tecnica/Ui/Components/CustomTextField.dart';
import 'package:prueba_tecnica/Ui/Pages/Login/Widgets/WidgetAuthGoogleApple.dart';
import 'package:prueba_tecnica/Ui/Pages/Login/Widgets/WidgetForgotPassword.dart';
import 'package:prueba_tecnica/Ui/Pages/Login/Widgets/WidgetOr.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final UserServices _userServices = UserServices();
  final TextEditingController controllerEmail = TextEditingController(text: "");
  final TextEditingController controllerPassword =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Encabezado personalizado
                        const CustomHeader(),

                        CustomTextField(
                          controller: controllerEmail,
                          text: "Enter your email",
                          icon: Icons.email_outlined,
                        ),

                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: controllerPassword,
                          text: "Password",
                          isPassword: true,
                          icon: Icons.lock_outline,
                        ),

                        const SizedBox(height: 20),

                        CustomButton(
                          colorText: Colors.black,
                          text: "Login",
                          function: () {
                            _userServices.LoginUser(
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                                context: context);
                          },
                          color: const Color(0xff00d0c1),
                        ),

                        const SizedBox(height: 10),

                        const WidgetForgotPassword(),

                        const WidgetOr(),

                        const SizedBox(height: 10),

                        const WidgetAuthGoogleApple(),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: CustomButton(
                        colorText: Colors.white,
                        text: "Create your account",
                        function: () {
                          Navigator.pushReplacementNamed(
                              context, '/create-account');
                        },
                        color: const Color(0xffD0000F),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
