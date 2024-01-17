import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/formnhapSV.dart';

class ql_sinhvien extends StatefulWidget {
  const ql_sinhvien({super.key});

  @override
  State<ql_sinhvien> createState() => _QuanLySinhVienState();
}
//
// class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Danh sách sinh viên",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.w600,
//             letterSpacing: 1,
//             wordSpacing: 2,
//             color: Colors.white,
//           ),
//         ),
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(20),
//               bottomLeft: Radius.circular(20)),
//         ),
//         elevation: 0.00,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Consumer<StudentProvider>(
//                 builder: (context, studentProvider, child) {
//                     if (studentProvider.currentStudent != null){
//                       return Card(
//                         child: Row(
//                           children: <Widget>[
//                             Container(
//                               margin: const EdgeInsets.symmetric(
//                                 vertical: 10,
//                                 horizontal: 15,
//                               ),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.purple,
//                                     width: 2,
//                                   )
//                               ),
//                               padding: const EdgeInsets.all(10),
//                               child: Text(
//                                   studentProvider.currentStudent!.diem
//                                       .toString(),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                     color: Colors.purple,
//                                   )
//                               ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                  Text(
//                                   studentProvider.currentStudent!.maSV
//                                       .toString() + ' - ' +
//                                       studentProvider.currentStudent!.hoten,
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                 } else {
//                   return const Text('Chưa thêm sinh viên nào', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),);
//                   }
//                 })
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (ctx) => FormNhapSinhVien(),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class _QuanLySinhVienState extends State<ql_sinhvien> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          "Danh sách sinh viên",
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
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
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
