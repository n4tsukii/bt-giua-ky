import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class SinhVien {
  final int maSV;
  final String hoten;
  final double diem;

  SinhVien({
    required this.maSV,
    required this.hoten,
    required this.diem
  });
}

class StudentProvider with ChangeNotifier {
  final List<SinhVien> dsSV = [];

  List<SinhVien> get currentStudent => dsSV;

  void addStudent(int maSV, String hoten, double diem) {
    SinhVien newStudent = SinhVien(maSV: maSV, hoten: hoten, diem: diem);
    dsSV.add(newStudent);
    notifyListeners();
  }
}