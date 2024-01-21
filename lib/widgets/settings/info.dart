import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/theme.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thông tin ứng dụng",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
        ),
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      ),
      body: const Center(
        child: Text(
          "Đây là trang thông tin ứng dụng.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
