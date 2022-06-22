import 'package:flutter/material.dart';
import 'package:login_app_v2/viewmodel/firebaseauth_viewmodel.dart';
import 'package:login_app_v2/widgets/my_elevatedbutton.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _firebaseAuthViewModel = FirebaseAuthViewModel();

  Future _logOut() async {
    await _firebaseAuthViewModel.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              MyElevatedButton("logut", _logOut)
            ],
          ),
        ),
      ),
    );
  }
}