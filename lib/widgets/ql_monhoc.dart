import 'package:flutter/material.dart';
import '../models/monhoc.dart';
import 'package:provider/provider.dart';
import 'components/theme.dart';
import 'monhoc/sua_monhoc.dart';
import 'monhoc/them_monhoc.dart';

class MonHocScreen extends StatefulWidget {
  const MonHocScreen({Key? key}) : super(key: key);

  @override
  State<MonHocScreen> createState() => _MonHocScreenState();
}

class _MonHocScreenState extends State<MonHocScreen>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách môn học",
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
      body: Consumer<MonHocState>(
        builder: (context, monHocState, child) {
          if (monHocState.course.isNotEmpty) {
                return Column(
                  children: monHocState.course.map((monHoc) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(15),
                        leading: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.1),
                          ),
                          child: Image.asset(
                            'assets/icons/book1.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        title: Text(
                          'Môn học: ${monHoc.ten}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số tín chỉ: ${monHoc.tinChi}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context){
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
                            if (value == 0){
                              showDialog(
                                  context: context,
                                  builder: (ctx) => SuaMonHoc(id: monHocState.course.indexOf(monHoc)),
                              );
                            } else if (value == 1){
                              _deleteMonHoc(context, monHoc);
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
                  'Chưa có môn học nào',
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
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return const ThemMonHoc();
          },);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(18),
          backgroundColor: const Color(0xFF62d4b0),
          minimumSize: const Size(40, 40),
          elevation: 10,
        ),
        child: const Text("+",style: TextStyle(fontSize: 40,color: Colors.white),),
      ),
    );
  }
  void _deleteMonHoc(BuildContext context, Monhoc monHoc){
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
            "Bạn có chắc chắn muốn xóa môn này không?",
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
                Provider.of<MonHocState>(context, listen: false).deleteMonHoc(monHoc);
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