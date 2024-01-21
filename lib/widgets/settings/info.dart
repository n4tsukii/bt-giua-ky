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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Phiên bản: 1.0.0",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              "Tác giả: Nhóm 11",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              "Mô tả:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Ứng dụng quản lý sinh viên.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              "Liên hệ:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Email: Nhom11@gmail.com",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
