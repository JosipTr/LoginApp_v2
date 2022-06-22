import 'package:flutter/material.dart';
import 'package:login_app_v2/assets/strings/strings.dart';
import 'package:login_app_v2/viewmodel/firebaseauth_viewmodel.dart';
import 'package:login_app_v2/widgets/my_elevatedbutton.dart';
import 'package:login_app_v2/widgets/my_textfield.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _isObscured = false;
  final _firebaseAuthViewModel = FirebaseAuthViewModel();
  final _emailController = TextEditingController();
  final _snackBar = const SnackBar(
      content: Text(Strings.invalidEmail), duration: Duration(milliseconds: 600));

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future _resetPassword() async {
    final String email = _emailController.text.trim();

    try {
      await _firebaseAuthViewModel.sendPasswordResetEmail(email);
      _emailController.clear();
      
      showDialog(context: context, builder: (context) => const Center(child: AlertDialog(title: Text("reseted"))));
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      _emailController.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child:
                  MyTextField(Strings.emailHint, _isObscured, _emailController),
            ),
            MyElevatedButton(Strings.resetPassword, _resetPassword)
          ],
        )),
      ),
    );
  }
}
