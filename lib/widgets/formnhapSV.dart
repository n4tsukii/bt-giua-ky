import "package:flutter/material.dart";

class FormNhapSinhVien extends StatelessWidget {
  final Function addSinhVien;

  final maController = TextEditingController();
  final hoVaTenController = TextEditingController();
  final diemTotNghiepController = TextEditingController();

  FormNhapSinhVien(this.addSinhVien);

  submitData() {
    final enterMaController = maController.text;
    final enterHoVaTenController = hoVaTenController.text;
    final enterDiemController = diemTotNghiepController.text;

    if (enterHoVaTenController.length > 3)
      addSinhVien(
        int.parse(enterMaController),
        enterHoVaTenController,
        double.parse(enterDiemController),
      );
    else
      return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhap SV'),
      ),
      body: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Ma sinh vien'),
                controller: maController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Ho va ten'),
                controller: hoVaTenController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Diem tot nghiep'),
                controller: diemTotNghiepController,
                onSubmitted: (_) => submitData(),
              ),
              TextButton(
                child: Text('Them sinh vien'),
                onPressed: (){
                  submitData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}


