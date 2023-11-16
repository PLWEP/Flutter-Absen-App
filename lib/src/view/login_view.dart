import 'package:absen_app/src/helper/firebase_helper.dart';
import 'package:absen_app/src/view/home_view.dart';
import 'package:absen_app/src/view/register_view.dart';
import 'package:absen_app/src/widget/custom_layout.dart';
import 'package:absen_app/src/widget/custom_text_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({
    super.key,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const routeName = '/login';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: CustomLayout(
            body: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontSize: 25,
                            fontFamily: 'Poppins-bold',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextInput(
                          title: "Email",
                          controller: _emailController,
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill The Field" : null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        PasswordTextInput(
                          title: "Password",
                          controller: _passwordController,
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill The Field" : null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegisterView.routeName,
                        );
                      },
                      child: const Text(
                        "Dont have an account? Register here",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 71, 161, 1),
                          fontSize: 13,
                          fontFamily: 'Poppins-bold',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await FirebaseHelper().register(
                              _emailController.text,
                              _passwordController.text,
                            );

                            if (result == "success") {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeView.routeName,
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
                        ),
                        child: const Text(
                          'Sign In',
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
      ),
    );
  }
}
