import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/monhoc.dart';
import '../components/theme.dart';

class ThemMonHoc extends StatefulWidget {
  const ThemMonHoc({Key? key}) : super(key: key);

  @override
  State<ThemMonHoc> createState() => _ThemMonHocState();
}

class _ThemMonHocState extends State<ThemMonHoc> {
  TextEditingController _tcController = TextEditingController();
  TextEditingController _mhController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tcController = TextEditingController();
    _mhController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      title: const Text('Thêm môn học'),
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
            child: const Text(
              'Thoát',
              style: TextStyle(color: Colors.white),
            )),
        ElevatedButton(
          onPressed: () {
            context.read<MonHocState>().addMonHoc(Monhoc(
                ten: _mhController.text,
                tinChi: int.parse(_tcController.text)));
            Navigator.of(context).pop();
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}