import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/atas.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
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
                      TextField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 15,
                          fontFamily: 'Poppins-regular',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          contentPadding: EdgeInsets.only(left: 15),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 15,
                          fontFamily: 'Poppins-regular',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          contentPadding: EdgeInsets.only(left: 15),
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Color(0xFF393939),
                          fontSize: 15,
                          fontFamily: 'Poppins-regular',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Konfirmasi Password',
                          contentPadding: EdgeInsets.only(left: 15),
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
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          width: 150,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(13, 71, 161, 1),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bawah2.png'),
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
