import 'package:flutter/material.dart';
import 'package:login_app_v2/view/login_view.dart';
import 'package:login_app_v2/view/register_view.dart';
import 'package:login_app_v2/widgets/my_navigationbar.dart';

class LoginRegisterView extends StatefulWidget {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  State<LoginRegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginRegisterView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: MyNavigationBar(),
        body: TabBarView(
          children: [LoginView(), RegisterView()],
        ),
      ),
    );
  }
}
