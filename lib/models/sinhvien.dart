import 'package:flutter/foundation.dart';

class SinhVien {
  late final int maSV;
  late final String hoten;
  double diem;
  late final String lop;

  SinhVien({
    required this.maSV,
    required this.hoten,
    required this.diem,
    required this.lop,

  });
}

class StudentProvider with ChangeNotifier {
  double threshold = 0.0;
  List<SinhVien> dsSV = [
    SinhVien(maSV: 22010498, hoten: "Phạm Như Thuật", diem: 5, lop: "K16"),
    SinhVien(maSV: 21010651, hoten: "Mạnh Tâm", diem: 6, lop: "K15"),
    SinhVien(maSV: 21010619, hoten: "Nguyễn Tuấn", diem: 7, lop: "K15")
  ];
  List<SinhVien> get currentStudent => filterStudents(threshold);

  void addStudent(int maSV, String hoten, double diem, String lop) {
    SinhVien newStudent = SinhVien(maSV: maSV, hoten: hoten, diem: diem, lop: lop);
    dsSV.add(newStudent);
    notifyListeners();
  }

  void deleteStudent(SinhVien student) {
    dsSV.remove(student);
    notifyListeners();
  }


  void updatethreshold(double threshold) {
    this.threshold = threshold;
    notifyListeners();
  }

  List<SinhVien> filterStudents(double threshold) {
    return dsSV.where((student) => student.diem > threshold).toList();
  }

}