import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class subject{
  final String name;
  final double? grade;

  subject({
    this.grade = null,
    required this.name,
  });
}

class SubjectProvider with ChangeNotifier {
  List<subject> listsubject = [
    subject(name: "Toan"),
    subject(name: "Hoa"),
  ];
}