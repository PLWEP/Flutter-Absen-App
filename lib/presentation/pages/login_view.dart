import 'package:absen_app/common/widget/loader.dart';
import 'package:absen_app/common/widget/custom_layout.dart';
import 'package:absen_app/common/widget/custom_text_input.dart';
import 'package:absen_app/presentation/providers/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void navigateToRegister() => Routemaster.of(context).push('/register');

  void login() => ref.read(authControllerProvider.notifier).signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
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
                        const SizedBox(height: 10),
                        CustomTextInput(
                            title: "Email",
                            controller: _emailController,
                            enabled: isLoading ? false : true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (!EmailValidator.validate(value)) {
                                return "Email is not valid";
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 15),
                        PasswordTextInput(
                          title: "Password",
                          controller: _passwordController,
                          enabled: isLoading ? false : true,
                          validator: (value) =>
                              value!.isEmpty ? "Please Fill The Field" : null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => navigateToRegister(),
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
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(13, 71, 161, 1),
                        ),
                        child: isLoading
                            ? const Loader()
                            : const Text(
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
