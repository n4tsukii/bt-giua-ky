import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/custom_widget.dart';
import 'components/theme.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);
  @override
  State<MySettings> createState() => _MySettings();
}

class _MySettings extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    bool _darkTheme = Provider.of<ThemeProvider>(context).isDarkModeEnabled;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cài đặt",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            color: Colors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          ),
        ),
        backgroundColor: Provider.of<ThemeProvider>(context).appBarColor,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              SingleSection(
                title: "General",
                children: [
                  CustomListTile(
                      title: "Chế độ tối",
                      icon: Icons.dark_mode_outlined,
                      trailing: Switch(
                          value: _darkTheme,
                          onChanged: (value) {
                            Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode();
                          })),
                  const CustomListTile(
                      title: "Thông báo",
                      icon: Icons.notifications_none_rounded),
                  const CustomListTile(
                      title: "Bảo mật",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
              const Divider(),
              const SingleSection(
                children: [
                  CustomListTile(
                      title: "Trợ giúp",
                      icon: Icons.help_outline_rounded),
                  CustomListTile(
                      title: "Thông tin ứng dụng",
                      icon: Icons.info_outline_rounded),
                  CustomListTile(
                      title: "Đăng xuất",
                      icon: Icons.exit_to_app_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
