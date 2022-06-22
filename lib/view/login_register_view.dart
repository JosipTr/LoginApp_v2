import 'package:flutter/material.dart';
import 'package:login_app_v2/assets/strings/strings.dart';
import 'package:login_app_v2/widgets/my_elevatedbutton.dart';
import 'package:login_app_v2/widgets/my_richtext.dart';
import 'package:login_app_v2/widgets/my_textfield.dart';
import 'package:login_app_v2/widgets/my_textformfield.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  State<LoginRegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginRegisterView> {
  final _isObscured = true;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPassTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPassTextController.dispose();
    super.dispose();
  }

  void _login() {}

  void _register() {}

  void _validateEmail() {}

  void _validatePassword() {}

  void _validateConfirmedPass() {}

  void _forgotPassword() {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: TabBarView(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: const SizedBox(
                        width: 200, height: 200, child: FlutterLogo()),
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
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: const SizedBox(
                        width: 200, height: 200, child: FlutterLogo()),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: MyTextFormField(Strings.emailHint, !_isObscured,
                        _emailTextController, _validateEmail),
                  ),
                  Container(
                      margin: const EdgeInsets.only(bottom: 10),
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
          ],
        ),
      ),
    );
  }
}

Widget menu() {
  return Container(
    color: Colors.blue,
    child: const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.all(5),
      indicatorColor: Colors.red,
      tabs: [
        Tab(
          text: "LogIn",
          icon: Icon(Icons.login),
        ),
        Tab(text: "Register", icon: Icon(Icons.app_registration)),
      ],
    ),
  );
}
