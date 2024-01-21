import 'package:flutter/cupertino.dart';

class Monhoc {
  final String ten;
  final double? diem;
  final int tinChi;

  Monhoc({
    this.diem,
    required this.ten,
    required this.tinChi,
  });
}

class MonHocState with ChangeNotifier{
  List<Monhoc> listMonHoc = [
    Monhoc(ten: "Toán", tinChi: 3),
    Monhoc(ten: "Lý", tinChi: 3),
    Monhoc(ten: "Hóa", tinChi: 2),
  ];
  List<Monhoc> get course => listMonHoc;

  void addMonHoc(Monhoc monHoc) {
    listMonHoc.add(monHoc);
    notifyListeners();
  }
  void deleteMonHoc(Monhoc monHoc) {
    listMonHoc.remove(monHoc);
    notifyListeners();
  }

  void updateMonHoc(int id, String ten, int tinChi) {
    Monhoc updatedMonHoc = Monhoc(ten: ten, tinChi: tinChi);
    listMonHoc[id] = updatedMonHoc;
    notifyListeners();
  }

}