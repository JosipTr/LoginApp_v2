import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login_app_v2/assets/strings/strings.dart';
import 'package:login_app_v2/viewmodel/firebaseauth_viewmodel.dart';
import 'package:login_app_v2/widgets/my_elevatedbutton.dart';
import 'package:login_app_v2/widgets/my_textformfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _isObscured = true;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();
  final _firebaseAuthViewModel = FirebaseAuthViewModel();
  final _snackBar = const SnackBar(
      content: Text(Strings.invalid), duration: Duration(milliseconds: 600));

  TextEditingController find() {
    return _emailTextController;
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPassTextController.dispose();
    super.dispose();
  }

  Future _register() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();



    if (_formKey.currentState!.validate()) {
      try {
        await _firebaseAuthViewModel.createUserWithEmailAndPassword(
            email, password);
        _emailTextController.clear();
        _passwordTextController.clear();
        _confirmPassTextController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(_snackBar);
      }
    }
  }

  String? _validateEmail() {
    String email = _emailTextController.text.trim();
    if (!EmailValidator.validate(email)) {
      return Strings.invalidEmail;
    } else {
      return null;
    }
  }

  String? _validatePassword() {
    String password = _passwordTextController.text.trim();
    if (password.length < 6) {
      return Strings.invalidPassword;
    } else {
      return null;
    }
  }

  String? _validateConfirmedPass() {
    String password = _passwordTextController.text.trim();
    String confirmPass = _confirmPassTextController.text.trim();
    if (password != confirmPass) {
      return Strings.passDontMatch;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child:
                  const SizedBox(width: 200, height: 173, child: FlutterLogo()),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: MyTextFormField(Strings.emailHint, !_isObscured,
                  _emailTextController, _validateEmail),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: MyTextFormField(Strings.passHint, _isObscured,
                    _passwordTextController, _validatePassword)),
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: MyTextFormField(Strings.confirmPass, _isObscured,
                    _confirmPassTextController, _validateConfirmedPass)),
            MyElevatedButton(Strings.register, _register)
          ],
        ),
      ),
    );
  }
}
