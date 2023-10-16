import 'package:absen_app/src/view/home_view.dart';
import 'package:absen_app/src/view/register_view.dart';
import 'package:absen_app/src/widget/custom_text_input.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  LoginView({
    super.key,
  });

  static const routeName = '/login';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/atas.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Log In',
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
                            height: 25,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 140,
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
                                backgroundColor:
                                    const Color.fromRGBO(13, 71, 161, 1),
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromRGBO(13, 71, 161, 1),
                              ),
                            ),
                            width: 140,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RegisterView.routeName,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  color: Color.fromRGBO(13, 71, 161, 1),
                                  fontSize: 20,
                                  fontFamily: 'Poppins-bold',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 250,
                foregroundDecoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bawah2.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
