import "package:flutter/material.dart";
import "package:setting_tab/models/sinhvien.dart";
import 'package:provider/provider.dart';

class FormNhapSinhVien extends StatelessWidget {
  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
        builder: (context, studentProvider, child) {
          return AlertDialog(
            title: Text('Thêm sinh viên'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: maController,
                  decoration: InputDecoration(labelText: 'Mã sinh viên'),
                ),
                TextField(
                  controller: hoVaTenController,
                  decoration: InputDecoration(labelText: 'Họ và Tên'),
                ),
                TextField(
                  controller: diemTotNghiepController,
                  decoration: InputDecoration(labelText: 'Điểm'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Hủy'),
              ),
              TextButton(
                onPressed: () {
                  int id = int.parse(maController.text);
                  String name = hoVaTenController.text;
                  double diem = double.parse(diemTotNghiepController.text);

                  Provider.of<StudentProvider>(context, listen: false)
                      .addStudent(id, name, diem);
                  Navigator.of(context).pop();
                },
                child: Text('Thêm'),
              ),
            ],
          );
        },
      );
    }
}

class StudentProvider with ChangeNotifier {
  SinhVien? _currentStudent;
  SinhVien? get currentStudent => _currentStudent;

  void addStudent(int maSV,String hoten, double diem) {
    _currentStudent = SinhVien(maSV: maSV, hoten: hoten, diem: diem);
    notifyListeners();
  }
}