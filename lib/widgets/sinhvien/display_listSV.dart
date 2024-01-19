import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';

class DanhSachSinhVien extends StatelessWidget {
  final List<SinhVien> danhSachSinhVien;

  DanhSachSinhVien(this.danhSachSinhVien);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentProvider>(
      builder: (context, studentProvider, child) {
        if (studentProvider.currentStudent.isNotEmpty) {
          return Column(
            children: studentProvider.currentStudent.map((student) {
              return Card(
                child: ListTile(
                  title: Text(
                    'Mã sinh viên: ${student.maSV}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Họ tên: ${student.hoten}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lớp: ${student.lop}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteStudent(context, student);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return const Text(
            'Chưa thêm sinh viên nào',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );
        }
      },
    );
  }
  void _deleteStudent(BuildContext context, SinhVien student) {
    Provider.of<StudentProvider>(context, listen: false).deleteStudent(student);
  }
}
