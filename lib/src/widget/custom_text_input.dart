import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final bool obsecure;
  const CustomTextInput({
    super.key,
    required this.title,
    this.obsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(13, 71, 161, 1),
          fontSize: 15,
          fontFamily: 'Poppins-regular',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(13, 71, 161, 1),
          ),
        ),
      ),
      cursorColor: Colors.black,
    );
  }
}

class PasswordTextInput extends CustomTextInput {
  const PasswordTextInput({
    super.key,
    required super.title,
    super.obsecure = true,
  });
}
