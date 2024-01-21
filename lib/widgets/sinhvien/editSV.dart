import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';

class EditStudentScreen extends StatelessWidget {
  final String studentId;

  const EditStudentScreen({super.key, required this.studentId});

  @override
  Widget build(BuildContext context) {
    var studentProvider = Provider.of<StudentProvider>(context);
    var student = studentProvider.dsSV.firstWhere((student) => student.maSV.toString() == studentId);

    final maController = TextEditingController();
    final hoVaTenController = TextEditingController();
    final diemTotNghiepController = TextEditingController();
    final lopController = TextEditingController();

    return Consumer<StudentProvider>(
      builder: (context, studentProvider, child) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Sửa sinh viên'),
          content: SizedBox(
            height: 450,
            width: 250,
            child: Column(
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
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy', style: TextStyle(color: Colors.white),),
            ),
            ElevatedButton(
              onPressed: () {
                int newMaSV = maController.text.isNotEmpty ? int.parse(maController.text) : student.maSV;
                String newHoten = hoVaTenController.text.isNotEmpty ? hoVaTenController.text : student.hoten;
                String newLop = lopController.text.isNotEmpty ? lopController.text : student.lop;
                double newDiem = diemTotNghiepController.text.isNotEmpty ? double.parse(diemTotNghiepController.text) : student.diem;

                _deleteStudent(context, student);
                Provider.of<StudentProvider>(context, listen: false)
                    .addStudent(newMaSV, newHoten, newDiem, newLop);

                Navigator.of(context).pop();
              },
              child: const Text('Lưu'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(BuildContext context, SinhVien student) {
    Provider.of<StudentProvider>(context, listen: false).deleteStudent(student);
  }
}
