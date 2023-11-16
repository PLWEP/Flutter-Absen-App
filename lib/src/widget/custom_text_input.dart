import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String title;
  final bool obsecure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextInput({
    super.key,
    required this.title,
    this.obsecure = false,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsecure,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(13, 71, 161, 1),
          fontSize: 13,
          fontFamily: 'Poppins-regular',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF837E93),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromRGBO(13, 71, 161, 1),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
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
    required super.controller,
    required super.validator,
    super.obsecure = true,
  });
}
