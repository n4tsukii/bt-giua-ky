import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/monhoc.dart';

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
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text('Sửa môn học'),
      content: SizedBox(
        height: 150,
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nhập tên môn học:'),
            SizedBox(
              height: 40,
              width: 200,
              child: TextFormField(
                controller: _mhController,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text('Nhập số tín:'),
                const SizedBox(width: 15),
                SizedBox(
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
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Hủy', style: TextStyle(color: Colors.white),)
        ),
        ElevatedButton(
          onPressed: () {
            context.read<MonHocState>().updateMonHoc(
                widget.id, _mhController.text,int.parse(_tcController.text)
            );
            Navigator.of(context).pop();
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}