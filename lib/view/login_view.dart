import 'package:flutter/material.dart';
import 'package:login_app_v2/assets/strings/strings.dart';
import 'package:login_app_v2/viewmodel/firebaseauth_viewmodel.dart';
import 'package:login_app_v2/widgets/my_elevatedbutton.dart';
import 'package:login_app_v2/widgets/my_richtext.dart';
import 'package:login_app_v2/widgets/my_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _isObscured = true;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _firebaseAuthViewModel = FirebaseAuthViewModel();
  final _snackBar = const SnackBar(
      content: Text(Strings.invalid), duration: Duration(milliseconds: 600));

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Future _login() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();

    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      await _firebaseAuthViewModel.signInWithEmailAndPassword(email, password);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      Navigator.pop(context);
    }
  }

  void _forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child:
                const SizedBox(width: 200, height: 173, child: FlutterLogo()),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: MyTextField(Strings.emailHint, !_isObscured),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: MyTextField(Strings.passHint, _isObscured)),
          Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: MyElevatedButton(Strings.login, _login)),
          MyRichText(Strings.forgotPass, _forgotPassword)
        ],
      ),
    );
  }
}
