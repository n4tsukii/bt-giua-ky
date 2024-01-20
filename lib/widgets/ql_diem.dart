import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';

class GradesScreen extends StatefulWidget {
  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  List<SinhVien> students = [];

  String selectedStudent = '';
  String selectedSubject = '';
  double grade = 0.0;

  @override
  Widget build(BuildContext context) {
    students = Provider.of<StudentProvider>(context).currentStudent;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điểm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStudentDropdown(),
            _buildSubjectDropdown(),
            _buildGradeInput(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addGrade();
              },
              child: const Text('Thêm điểm'),
            ),
            const SizedBox(height: 20),
            _buildStudentAverage(),
            const SizedBox(height: 20),
            _buildSubjectStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentDropdown() {
    return DropdownButton<String>(
      hint: const Text('Chọn sinh viên'),
      value: selectedStudent.isNotEmpty ? selectedStudent : null,
      onChanged: (newValue) {
        setState(() {
          selectedStudent = newValue!;
        });
      },
      items: students.map((student) {
        return DropdownMenuItem<String>(
          value: student.hoten,
          child: Text(student.hoten),
        );
      }).toList(),
    );
  }

  Widget _buildSubjectDropdown() {
    return DropdownButton<String>(
      hint: const Text('Chọn môn học'),
      value: selectedSubject.isNotEmpty ? selectedSubject : null,
      onChanged: (newValue) {
        setState(() {
          selectedSubject = newValue!;
        });
      },
      items: ['Math', 'History', 'Physics', 'Biology'].map((subject) {
        return DropdownMenuItem<String>(
          value: subject,
          child: Text(subject),
        );
      }).toList(),
    );
  }

  Widget _buildGradeInput() {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          grade = double.tryParse(value) ?? 0.0;
        });
      },
      decoration: const InputDecoration(
        labelText: 'Điểm số',
      ),
    );
  }

  void _addGrade() {
    if (selectedStudent.isNotEmpty && selectedSubject.isNotEmpty) {
      // Tìm sinh viên trong danh sách
      SinhVien? student = students.firstWhere(
            (student) => student.hoten == selectedStudent,
        orElse: () => SinhVien(
          maSV: 0,
          hoten: "",
          lop: "",
          diem: 0.0,
        ),
      );

      // Nếu sinh viên tồn tại, thêm điểm cho môn học đã chọn
      if(student != null){
        // Thêm điểm cho môn học đã chọn
        student.diem = grade;
        // Hiển thị thông báo thành công
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã thêm điểm cho $selectedStudent - $selectedSubject: $grade'),
          ),
        );
      } else {
        // Hiển thị thông báo thành công hoặc thông báo lỗi nếu có
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã thêm điểm cho $selectedStudent - $selectedSubject: $grade'),
          ),
        );
      }
    }
  }

  Widget _buildStudentAverage() {
    if (selectedStudent.isNotEmpty) {
      // Tìm sinh viên trong danh sách
      SinhVien? student = students.firstWhere(
            (SinhVien student) => student.hoten == selectedStudent,
        orElse: () => SinhVien(
          maSV: 0,
          hoten: "",
          lop: "",
          diem: 0.0,
        ),
      );

      // Nếu sinh viên tồn tại và có điểm, tính điểm trung bình
      if (student != null && student.diem != null) {
        double average = student.diem;
        return Text('Điểm trung bình của $selectedStudent: ${average.toStringAsFixed(2)}');
      } else {
        // Xử lý trường hợp sinh viên không tồn tại hoặc không có điểm
        return Text('Không có thông tin điểm của $selectedStudent');
      }
    }

    return Container();
  }

  Widget _buildSubjectStats() {
    if (selectedSubject.isNotEmpty) {
      // Tính điểm trung bình của môn học cho tất cả sinh viên
      double subjectAverage = 0.0;
      int studentCount = 0;

      for (SinhVien student in students) {
        if (student.diem != null) {
          subjectAverage += student.diem;
          studentCount++;
        }
      }

      if (studentCount > 0) {
        subjectAverage /= studentCount;
        return Text('Điểm trung bình môn $selectedSubject: ${subjectAverage.toStringAsFixed(2)}');
      } else {
        return Text('Chưa có sinh viên nào có điểm môn $selectedSubject');
      }
    }

    return Container();
  }
}
