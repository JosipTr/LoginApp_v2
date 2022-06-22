import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
