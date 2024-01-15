import 'package:flutter/material.dart';
import '../models/sinhvien.dart';
import '../widgets/formnhapSV.dart';
import '../widgets/danhsachSV.dart';

class ql_sinhvien extends StatefulWidget {
  @override
  State<ql_sinhvien> createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
  final List<SinhVien> danhSachSinhVien = [
    SinhVien(
      maSV : 12345678,
      hoten : "Nguyen Thi Huong",
      ngaySinh : DateTime(2002, 8, 20),
      diem : 8.2,
    ),
    SinhVien(
      maSV : 22334455,
      hoten : "Tran Van Doan",
      ngaySinh : DateTime(1999, 12, 7),
      diem : 7.9,
    ),
  ];

  addSinhVien(int ma, String hoVaTen, double diemTotNghiep) {
    final newSinhVien = SinhVien(
      maSV: ma,
      hoten: hoVaTen,
      ngaySinh: DateTime.now(),
      diem: diemTotNghiep,
    );

    setState(() {
      danhSachSinhVien.add(newSinhVien);
      notifyListeners();
    });
  }

  formAddSinhVien(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FormNhapSinhVien(addSinhVien);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quan Ly Sinh Vien"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DanhSachSinhVien(danhSachSinhVien),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           FormNhapSinhVien(addSinhVien);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
