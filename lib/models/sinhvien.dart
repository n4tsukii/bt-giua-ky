import 'package:flutter/foundation.dart';

class SinhVien {
  final int maSV;
  final String hoten;
  late final double diem;
  final String lop;

  SinhVien({
    required this.maSV,
    required this.hoten,
    required this.diem,
    required this.lop,
  });
}

class StudentProvider with ChangeNotifier {
  List<SinhVien> dsSV = [
    SinhVien(maSV: 22010498, hoten: "Pham Nhu Thuat", diem: 2, lop: "K16"),
    SinhVien(maSV: 21010651, hoten: "Manh Tam", diem: 3, lop: "K15"),
  ];
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

  void filterStudentsByAverage(double threshold) {
    dsSV = dsSV.where((student) => student.diem > threshold).toList();
    notifyListeners();
  }
}