import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';
import 'components/theme.dart';
import 'sinhvien/display_listSV.dart';
import 'sinhvien/formnhapSV.dart';

class ql_sinhvien extends StatefulWidget {
  const ql_sinhvien({super.key});
  @override
  State<ql_sinhvien> createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
  double threshold = 0.0;
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
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_outlined),
            onPressed: () {
              _showThresholdDialog(context);
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        elevation: 0.00,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      ),
      body: SingleChildScrollView(
          child: DanhSachSinhVien(danhSachSinhVien)),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FormNhapSinhVien(),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(18),
          backgroundColor: const Color(0xFF62d4b0),
          minimumSize: const Size(40, 40),
          elevation: 10,
        ),
        child: const Text("+", style: TextStyle(fontSize: 40, color: Colors.white),),
      ),
    );
  }

  Future<void> _showThresholdDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nhập giá trị cần lọc'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                threshold = double.tryParse(value) ?? 0.0;
              });
            },
            decoration: const InputDecoration(labelText: 'Nhập giá trị'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<StudentProvider>(context, listen: false).updatethreshold(threshold);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}