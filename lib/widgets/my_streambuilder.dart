import 'package:flutter/material.dart';
import 'package:login_app_v2/view/home_view.dart';
import 'package:login_app_v2/view/login_register_view.dart';
import 'package:login_app_v2/viewmodel/firebaseauth_viewmodel.dart';

class MyStreamBuilder extends StatelessWidget {
  const MyStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthViewModel firebaseAuthViewModel = FirebaseAuthViewModel();
    
    return StreamBuilder(
      stream: firebaseAuthViewModel.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return const LoginRegisterView();
          }
        }
    );
  }
}