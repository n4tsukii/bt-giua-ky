import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

// Inside MonHocState class
// class MonHocState with ChangeNotifier {
//   List<Monhoc> listMonHoc = [
//     Monhoc(ten: "Toan", tinChi: 3),
//     Monhoc(ten: "Hoa", tinChi: 3),
//     Monhoc(ten: "Ly", tinChi: 2),
//   ];
// }
