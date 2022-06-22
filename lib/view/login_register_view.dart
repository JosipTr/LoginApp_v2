import 'package:flutter/material.dart';
import 'package:login_app_v2/view/login_view.dart';
import 'package:login_app_v2/view/register_view.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  State<LoginRegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginRegisterView> {
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: const TabBarView(
          children: [LoginView(), RegisterView()],
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
