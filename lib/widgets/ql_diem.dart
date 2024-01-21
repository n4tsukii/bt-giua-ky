import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';
import 'components/theme.dart';

class QLDiem extends StatefulWidget {
  const QLDiem({super.key});

  @override
  _QLDiem createState() => _QLDiem();
}

class _QLDiem extends State<QLDiem> {
  List<SinhVien> students = [];

  String selectedStudent = '';
  String selectedSubject = '';
  double grade = 0.0;

  @override
  Widget build(BuildContext context) {
    students = Provider.of<StudentProvider>(context).currentStudent;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Điểm',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        elevation: 0.00,
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildGradeInput(),
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton<String>(
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
        ),
      )
    );
  }

  Widget _buildSubjectDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton<String>(
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
        ),
      )
    );
  }

  Widget _buildGradeInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nhập điểm',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildStudentDropdown(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildSubjectDropdown(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              grade = double.tryParse(value) ?? 0.0;
            });
          },
          decoration: const InputDecoration(
            labelText: 'Điểm số',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              _addGrade();
            },
            child: const Text('Thêm điểm'),
        )
      ],
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
      if (student != null) {
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
