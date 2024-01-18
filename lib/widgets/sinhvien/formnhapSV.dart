import "package:flutter/material.dart";
import "package:setting_tab/models/sinhvien.dart";
import 'package:provider/provider.dart';

class FormNhapSinhVien extends StatelessWidget {
  FormNhapSinhVien({super.key});

  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();
  final lopController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
        builder: (context, studentProvider, child) {
          return AlertDialog(
            title: const Text('Thêm sinh viên'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: maController,
                  decoration: const InputDecoration(labelText: 'Mã sinh viên'),
                ),
                TextField(
                  controller: hoVaTenController,
                  decoration: const InputDecoration(labelText: 'Họ và Tên'),
                ),
                TextField(
                  controller: lopController,
                  decoration: const InputDecoration(labelText: 'Lớp'),
                ),
                TextField(
                  controller: diemTotNghiepController,
                  decoration: const InputDecoration(labelText: 'Điểm'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Hủy'),
              ),
              TextButton(
                onPressed: () {
                  int id = int.parse(maController.text);
                  String name = hoVaTenController.text;
                  double diem = double.parse(diemTotNghiepController.text);
                  String lop = lopController.text;

                  Provider.of<StudentProvider>(context, listen: false)
                      .addStudent(id, name, diem, lop);
                  Navigator.of(context).pop();
                },
                child: const Text('Thêm'),
              ),
            ],
          );
        },
      );
    }
}