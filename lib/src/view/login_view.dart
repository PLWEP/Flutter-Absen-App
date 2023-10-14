import 'package:absen_app/src/view/home_view.dart';
import 'package:absen_app/src/view/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
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
                        TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF393939),
                            fontSize: 15,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            contentPadding: EdgeInsets.only(left: 15),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(13, 71, 161, 1),
                              fontSize: 15,
                              fontFamily: 'Poppins-regular',
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF837E93),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(13, 71, 161, 1),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xFF393939),
                            fontSize: 15,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            contentPadding: EdgeInsets.only(left: 15),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(13, 71, 161, 1),
                              fontSize: 15,
                              fontFamily: 'Poppins-regular',
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF837E93),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(13, 71, 161, 1),
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
