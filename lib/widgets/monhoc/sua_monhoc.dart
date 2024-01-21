import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/monhoc_state.dart';

class SuaMonHoc extends StatefulWidget {
  const SuaMonHoc({super.key,required this.id,});
  final int id;

  @override
  State<SuaMonHoc> createState() => _SuaMonHocState();
}

class _SuaMonHocState extends State<SuaMonHoc> {
  TextEditingController _tcController = TextEditingController();
  TextEditingController _mhController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tcController = TextEditingController(
        text: context.read<MonHocState>().listMonHoc[widget.id].tinChi.toString());
    _mhController =
        TextEditingController(text: context.read<MonHocState>().listMonHoc[widget.id].ten);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      backgroundColor: Color(0xFFFDEBED),
      title: Text('Thêm môn học'),
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nhập tên môn học:'),
            Container(
              height: 40,
              width: 200,
              child: TextFormField(
                controller: _mhController,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text('Nhập số tín:'),
                SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 40,
                  child: TextFormField(
                    controller: _tcController,

                  ),
                )
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Thoát',
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
          onPressed: () {
            context.read<MonHocState>().updateMonHoc(widget.id, _mhController.text,int.parse(_tcController.text));
            Navigator.of(context).pop();
          },
          child: Text('Lưu'),
        ),
      ],
    );;
  }
}