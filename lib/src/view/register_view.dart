import 'package:absen_app/src/view/home_view.dart';
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
      body: Column(
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
                  Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromRGBO(13, 71, 161, 1),
                          fontSize: 35,
                          fontFamily: 'Poppins-bold',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontSize: 15,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(13, 71, 161, 1),
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontSize: 15,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(13, 71, 161, 1),
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontSize: 15,
                            fontFamily: 'Poppins-regular',
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFF837E93),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(13, 71, 161, 1),
                            ),
                          ),
                        ),
                        cursorColor: Colors.black,
                      ),
                      const SizedBox(
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
    );
  }
}
