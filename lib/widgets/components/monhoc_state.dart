import 'package:flutter/material.dart';
import '../../models/monhoc.dart';

class MonHocState extends ChangeNotifier{
  List<Monhoc> listMonHoc = [
    Monhoc(ten: "Toan", tinChi: 3),
    Monhoc(ten: "Hoa", tinChi: 3),
    Monhoc(ten: "Ly", tinChi: 2),
  ];
  List<Monhoc> get _monHocState => _monHocState;

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