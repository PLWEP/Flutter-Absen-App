import 'package:absen_app/common/loader.dart';
import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/src/widget/custom_layout.dart';
import 'package:absen_app/src/widget/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void backToLogin(BuildContext context) => Routemaster.of(context).pop();

  void register() =>
      ref.read(authControllerProvider.notifier).registerWithEmail(
            context,
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: CustomLayout(
          body: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            },
                          ),
                          const SizedBox(height: 10),
                          PasswordTextInput(
                            title: "Password",
                            controller: _passwordController,
                            enabled: isLoading ? false : true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (value.length < 6) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          PasswordTextInput(
                            title: "Confirm Password",
                            controller: _confirmPasswordController,
                            enabled: isLoading ? false : true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Fill The Field";
                              } else if (_passwordController.text !=
                                  _confirmPasswordController.text) {
                                return "Password does not match";
                              } else if (value.length < 6) {
                                return "Password is too short";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => backToLogin(context),
                        child: const Text(
                          "Already have an account? Login here",
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
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              register();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(13, 71, 161, 1),
                          ),
                          child: isLoading
                              ? const Loader()
                              : const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Poppins-bold',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
