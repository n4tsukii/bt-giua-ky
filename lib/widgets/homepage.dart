import '/widgets/components/my_drawer.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Homepage"),
            backgroundColor: ui.appBarColor,
          ),

          drawer: MyDrawer(),

          body: Center(
            child: Text(
              "Trang chủ",
              style: TextStyle(
                fontSize: ui.fontSize,
              )
            ),
          ),
        );
      },
    );
  }
}
