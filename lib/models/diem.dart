import 'package:flutter/foundation.dart';

class Diem {
  final int maSV;
  final String tenMonHoc;
  double diem;

  Diem({
    required this.maSV,
    required this.tenMonHoc,
    required this.diem,
  });
}

class DiemProvider with ChangeNotifier {
  List<Diem> dsDiem = [];

  void addDiem(Diem diem) {
    dsDiem.add(diem);
    notifyListeners();
  }

  List<Diem> getDiemByMaSV(int maSV) {
    return dsDiem.where((diem) => diem.maSV == maSV).toList();
  }

  double getDiemTrungBinh(int maSV) {
    List<Diem> diemSV = getDiemByMaSV(maSV);

    if (diemSV.isEmpty) {
      return 0.0;
    }

    double totalDiem = 0.0;
    for (var diem in diemSV) {
      totalDiem += diem.diem;
    }

    return totalDiem / diemSV.length;
  }

  Map<String, List<Diem>> thongKeDiemTheoMonHoc() {
    Map<String, List<Diem>> result = {};

    for (var diem in dsDiem) {
      if (!result.containsKey(diem.tenMonHoc)) {
        result[diem.tenMonHoc] = [];
      }
      result[diem.tenMonHoc]!.add(diem);
    }

    return result;
  }
}