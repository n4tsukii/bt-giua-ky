import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/monhoc.dart';
import '../../models/sinhvien.dart';
import '../../models/diem.dart';
import 'components/theme.dart';

class QLDiem extends StatefulWidget {
  const QLDiem({super.key});

  @override
  _QLDiem createState() => _QLDiem();
}

class _QLDiem extends State<QLDiem> {
  List<SinhVien> students = [];
  List<Monhoc> courses = [];
  String selectedStudent = '';
  String selectedSubject = '';
  double grade = 0.0;

  @override
  Widget build(BuildContext context) {
    students = Provider.of<StudentProvider>(context).currentStudent;
    courses = Provider.of<MonHocState>(context).course;
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
          items: courses.map((subject) {
            return DropdownMenuItem<String>(
              value: subject.ten,
              child: Text(subject.ten),
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
        Diem newDiem = Diem(
          maSV: student.maSV,
          tenMonHoc: selectedSubject,
          diem: grade,
        );
          Provider.of<DiemProvider>(context, listen: false).addDiem(newDiem);

        Provider.of<StudentProvider>(context, listen: false).updateStudentAverage(context, student.maSV);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã thêm điểm cho $selectedStudent - $selectedSubject: $grade'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Không tìm thấy sinh viên $selectedStudent'),
          ),
        );
      }
    }
  }

  Widget _buildStudentAverage() {
    if (selectedStudent.isNotEmpty) {
      SinhVien? student = students.firstWhere(
            (SinhVien student) => student.hoten == selectedStudent,
        orElse: () => SinhVien(
          maSV: 0,
          hoten: "",
          lop: "",
          diem: 0.0,
        ),
      );

      if (student != null && student.diem != null) {
        double average = student.diem;
        return Text('Điểm trung bình của $selectedStudent: ${average.toStringAsFixed(2)}');
      } else {
        return Text('Không có thông tin điểm của $selectedStudent');
      }
    }

    return Container();
  }

  Widget _buildSubjectStats() {
    if (selectedSubject.isNotEmpty) {
      SinhVien? student = students.firstWhere(
            (SinhVien student) => student.hoten == selectedStudent,
        orElse: () => SinhVien(
          maSV: 0,
          hoten: "",
          lop: "",
          diem: 0.0,
        ),
      );
      double subjectAverage = 0.0;
      int studentCount = 0;

      for (SinhVien student in students) {
        List<Diem> diemSV = Provider.of<DiemProvider>(context).getDiemByMaSV(student.maSV);
        Diem? diemMonHoc = diemSV.firstWhere(
              (diem) => diem.tenMonHoc == selectedSubject,
          orElse: () => Diem(maSV: 0, tenMonHoc: "", diem: 0.0),
        );

        if (diemMonHoc.maSV != 0) {
          subjectAverage += diemMonHoc.diem;
          studentCount++;
        }
      }
      if (studentCount > 0) {
        subjectAverage /= studentCount;
        List<Diem> diemSV = Provider.of<DiemProvider>(context).getDiemByMaSV(student.maSV);
        Diem? diemMonHoc = diemSV.firstWhere(
              (diem) => diem.tenMonHoc == selectedSubject,
          orElse: () => Diem(maSV: 0, tenMonHoc: "", diem: 0.0),
        );
        return Text('Điểm môn $selectedSubject: ${diemMonHoc.diem.toStringAsFixed(2)}');
      } else {
        return Text('Sinh viên chưa có điểm môn $selectedSubject');
      }
    }
    return Container();
  }
}
