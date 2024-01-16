import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_tab/models/sinhvien.dart';
import '../widgets/formnhapSV.dart';

class ql_sinhvien extends StatefulWidget {
  @override
  State<ql_sinhvien> createState() => _QuanLySinhVienState();
}

class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản Lý Sinh Viên"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<StudentProvider>(
                builder: (context, studentProvider, child) {
                    if (studentProvider.currentStudent != null)
                      return Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  )
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  studentProvider.currentStudent!.diem.toString(),
                                  style: TextStyle (
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
                                  studentProvider.currentStudent!.maSV.toString() + ' - ' + studentProvider.currentStudent!.hoten,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    else
                      return Text('Chưa thêm sinh viên nào', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),);
                })
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FormNhapSinhVien(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
