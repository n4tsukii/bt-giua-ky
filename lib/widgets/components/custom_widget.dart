import "package:flutter/material.dart";
import 'package:setting_tab/widgets/ql_monhoc.dart';
import '../../widgets/ql_diem.dart';
import 'package:setting_tab/widgets/ql_sinhvien.dart';
import 'package:setting_tab/widgets/settings.dart';

void handleNavigation(BuildContext context, int index) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ql_sinhvien()),
    );
  } else if (index == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MonHocScreen()),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QLDiem()),
    );
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MySettings()),
    );
  }
}


class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
    );
  }
}

class SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}
