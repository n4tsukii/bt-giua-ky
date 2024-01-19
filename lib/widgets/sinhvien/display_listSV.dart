import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/sinhvien.dart';

class DanhSachSinhVien extends StatefulWidget {
  final List<SinhVien> danhSachSinhVien;
  DanhSachSinhVien(this.danhSachSinhVien);

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
          // ElevatedButton(
          //   onPressed: () => _showThresholdDialog(context),
          //   child: const Text('Lọc Sinh Viên'),
          // ),
          Consumer<StudentProvider>(
            builder: (context, studentProvider, child) {
              if (studentProvider.currentStudent.isNotEmpty) {
                return Column(
                  children: studentProvider.currentStudent.map((student) {
                    return Card(
                      child: ListTile(
                        title: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  )),
                              padding: const EdgeInsets.all(10),
                              child: Text(student.diem.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.purple,
                                  )),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mã sinh viên: ${student.maSV}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Họ tên: ${student.hoten}',
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Lớp: ${student.lop}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PopupMenuButton(
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
                              onSelected:(value) {
                                if (value == 0) {

                                } else if (value == 1) {
                                  _deleteStudent(context, student);
                                }
                              }
                            )
                          ],
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
    Provider.of<StudentProvider>(context, listen: false).deleteStudent(student);
  }

  //
  // Future<void> _showThresholdDialog(BuildContext context) async {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Nhập giá trị n'),
  //         content: TextField(
  //           keyboardType: TextInputType.number,
  //           onChanged: (value) {
  //             setState(() {
  //               threshold = double.tryParse(value) ?? 0.0;
  //             });
  //           },
  //           decoration: const InputDecoration(labelText: 'Nhập giá trị n'),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Hủy'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Provider.of<StudentProvider>(context, listen: false).filterStudentsByAverage(threshold);
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

}