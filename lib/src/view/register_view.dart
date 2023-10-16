import 'package:absen_app/src/view/home_view.dart';
import 'package:absen_app/src/widget/custom_layout.dart';
import 'package:absen_app/src/widget/custom_text_input.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    super.key,
  });

  static const routeName = '/register';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: CustomLayout(
          body: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromRGBO(13, 71, 161, 1),
                          fontSize: 35,
                          fontFamily: 'Poppins-bold',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextInput(title: "Email"),
                      SizedBox(
                        height: 15,
                      ),
                      PasswordTextInput(title: "Password"),
                      SizedBox(
                        height: 15,
                      ),
                      PasswordTextInput(title: "Confirm Password"),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeView.routeName,
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Poppins-bold',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
