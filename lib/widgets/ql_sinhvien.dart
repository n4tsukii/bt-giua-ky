import 'package:flutter/material.dart';
import 'sinhvien/formnhapSV.dart';
import 'sinhvien/display_listSV.dart';
import '../models/sinhvien.dart';


class ql_sinhvien extends StatefulWidget {
  const ql_sinhvien({super.key});
  @override
  State<ql_sinhvien> createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
  final List<SinhVien> danhSachSinhVien = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          "Danh sách sinh viên",
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
              bottomLeft: Radius.circular(20)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
          child: DanhSachSinhVien(danhSachSinhVien)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FormNhapSinhVien(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
