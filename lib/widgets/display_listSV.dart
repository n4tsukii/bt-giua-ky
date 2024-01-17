import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sinhvien.dart';

class DanhSachSinhVien extends StatelessWidget {
  final List<SinhVien> danhSachSinhVien;
  DanhSachSinhVien(this.danhSachSinhVien);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<StudentProvider>(
              builder: (context, studentProvider, child) {
                if (studentProvider.currentStudent.isNotEmpty) {
                  return Column(
                    children: studentProvider.currentStudent.map((student) {
                      return Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                  student.diem.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purple,
                                  )
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${student.maSV} - ${student.hoten}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
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
            ),
          ],
        ),
      ),
    );
  }
}
