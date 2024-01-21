import 'package:flutter/material.dart';
import '../models/monhoc.dart';
import 'package:provider/provider.dart';
import 'components/monhoc_state.dart';
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
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      ),
      body: Selector<MonHocState, List<Monhoc>>(
        selector: (ctx, state) => state.listMonHoc,
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: Color(0xFFf4f6f5),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return SuaMonHoc(id: index);
                          },);
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Image.asset(
                                  'assets/icons/book1.png',
                                width: 40,
                                height: 40,
                              ),
                              // const Image(
                              //     image: AssetImage('assets/icons/book1.png'),
                              //     width: 10,
                              //     height: 10
                              // ),
                              SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Môn học: ${value[index].ten}"),
                                  Text("số tín: ${value[index].tinChi}"),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Color(0xFFE40327),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFF950018)),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(5),
                          color: Colors.white,
                          icon: Icon(Icons.close),
                          iconSize: 20,
                          onPressed: () {
                            context.read<MonHocState>().deleteMonHoc(value[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return ThemMonHoc();
          },);
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(18),
          backgroundColor: Color(0xFF62d4b0),
          minimumSize: Size(40, 40),
          elevation: 10,
        ),
        child: const Text("+",style: TextStyle(fontSize: 40,color: Colors.white),),
      ),
    );
  }
}

