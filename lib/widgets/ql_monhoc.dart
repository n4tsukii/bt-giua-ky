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
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số tín chỉ: ${monHoc.tinChi}',
                              style: const TextStyle(fontSize: 14),
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
      // body: Selector<MonHocState, List<Monhoc>>(
      //   selector: (ctx, state) => state.listMonHoc,
      //   builder: (context, value, child) {
      //     return ListView.builder(
      //       itemCount: value.length,
      //       itemBuilder: (context, index) {
      //         return Padding(
      //           padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
      //           child: Container(
      //             height: 80,
      //             decoration: BoxDecoration(
      //                 color: Color(0xFFf4f6f5),
      //                 borderRadius: BorderRadius.circular(10)
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 GestureDetector(
      //                   onTap: () {
      //                     showDialog(context: context, builder: (context) {
      //                       return SuaMonHoc(id: index);
      //                     },);
      //                   },
      //                   child: Container(
      //                     child: Row(
      //                       children: [
      //                         Image.asset(
      //                             'assets/icons/book1.png',
      //                           width: 40,
      //                           height: 40,
      //                         ),
      //                         SizedBox(width: 12),
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text("Môn học: ${value[index].ten}"),
      //                             Text("số tín: ${value[index].tinChi}"),
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   margin: EdgeInsets.symmetric(vertical: 12),
      //                   height: 35,
      //                   width: 35,
      //                   decoration: BoxDecoration(
      //                     color: Color(0xFFE40327),
      //                     borderRadius: BorderRadius.circular(20),
      //                     border: Border.all(color: Color(0xFF950018)),
      //                   ),
      //                   child: IconButton(
      //                     padding: EdgeInsets.all(5),
      //                     color: Colors.white,
      //                     icon: Icon(Icons.close),
      //                     iconSize: 20,
      //                     onPressed: () {
      //                       context.read<MonHocState>().deleteMonHoc(value[index]);
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
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
    Provider.of<MonHocState>(context, listen: false).deleteMonHoc(monHoc);
  }
}