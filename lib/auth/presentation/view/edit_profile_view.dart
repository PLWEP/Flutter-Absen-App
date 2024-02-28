import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/text_form_activity_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class EditProfileView extends ConsumerStatefulWidget {
  const EditProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileViewState();
}

class _EditProfileViewState extends ConsumerState<EditProfileView> {
  final TextEditingController _nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void backToProfle(BuildContext context) =>
      Routemaster.of(context).push('/profile');

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  void editProfile(UserModel user) =>
      ref.read(authNotifierProvider.notifier).editProfile(
            context,
            user,
            null,
            _nameController.text.trim(),
          );

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => backToProfle(context),
        ),
        backgroundColor: Constants.defaultColor,
        title: const Text(
          'Add Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    enabled:
                        authState.state == EnumState.loading ? false : true,
                    controller: _nameController,
                    validator: (value) =>
                        value!.isEmpty ? "Please Fill The Field" : null,
                    decoration: decoration,
                    cursorColor: Colors.black,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          editProfile(authState.userData!);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.defaultColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: authState.state == EnumState.loading
                          ? const Loader()
                          : const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
