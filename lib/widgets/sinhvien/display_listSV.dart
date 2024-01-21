import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_tab/widgets/sinhvien/editSV.dart';
import '../../models/sinhvien.dart';


class DanhSachSinhVien extends StatefulWidget {
  final List<SinhVien> danhSachSinhVien;
  const DanhSachSinhVien(this.danhSachSinhVien, {super.key});

  @override
  State<DanhSachSinhVien> createState() => _DanhSachSinhVienState();
}

class _DanhSachSinhVienState extends State<DanhSachSinhVien> {
  double threshold = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer<StudentProvider>(
            builder: (context, studentProvider, child) {
              if (studentProvider.currentStudent.isNotEmpty) {
                return Column(
                  children: studentProvider.currentStudent.map((student) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple.withOpacity(0.1),
                          ),
                          child: Text(
                            student.average.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        title: Text(
                          'Mã sinh viên: ${student.maSV}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Họ tên: ${student.hoten}',
                              style: const TextStyle(fontSize: 15),
                            ),
                            Text(
                              'Lớp: ${student.lop}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem<int>(
                                value: 0,
                                child: Text("Sửa"),
                              ),
                              const PopupMenuItem<int>(
                                value: 1,
                                child: Text("Xóa"),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            if (value == 0) {
                              showDialog(
                                context: context,
                                builder: (ctx) => EditStudentScreen(studentId: student.maSV.toString()),
                              );
                            } else if (value == 1) {
                              _deleteStudent(context, student);
                            }
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: Text(
                      'Chưa có sinh viên nào',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
  void _deleteStudent(BuildContext context, SinhVien student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text(
            "Xác nhận xóa",
            style: TextStyle(
              fontSize: 25,
                fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "Bạn có chắc chắn muốn xóa sinh viên này không?",
            style: TextStyle(
                fontSize: 17,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Hủy"),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                Provider.of<StudentProvider>(context, listen: false).deleteStudent(student);
                Navigator.pop(context); // Đóng hộp thoại
              },
              child: const Text("Xóa", style: TextStyle(color: Colors.white),),
            ),
          ],
        );
      },
    );
  }
}