import 'package:flutter/foundation.dart';

class SinhVien {
  final int maSV;
  final String hoten;
  final double diem;
  final String lop;

  SinhVien({
    required this.maSV,
    required this.hoten,
    required this.diem,
    required this.lop,
  });
}

class StudentProvider with ChangeNotifier {
  final List<SinhVien> dsSV = [];

  List<SinhVien> get currentStudent => dsSV;

  void addStudent(int maSV, String hoten, double diem, String lop) {
    SinhVien newStudent = SinhVien(maSV: maSV, hoten: hoten, diem: diem, lop: lop);
    dsSV.add(newStudent);
    notifyListeners();
  }
  void deleteStudent(SinhVien student) {
    dsSV.remove(student);
    notifyListeners();
  }
}