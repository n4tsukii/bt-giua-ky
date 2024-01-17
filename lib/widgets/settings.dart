import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'components/custom_widget.dart';
import 'components/theme.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);
  @override
  State<MySettings> createState() => _MySettings();
}

class _MySettings extends State<MySettings> {
  bool _darkTheme = false;
  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider.of<ThemeNotifier>(context);
    // _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Theme(
      data: _darkTheme ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
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
                bottomLeft: Radius.circular(20)),
          ),
          elevation: 0.00,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                SingleSection(
                  title: "General",
                  children: [
                    // ListTile(
                    //   leading: const Icon(Icons.brush_outlined),
                    //   title: const Text('Theme'),
                    //   contentPadding:
                    //   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    //   trailing: DayNightSwitcher(
                    //     isDarkModeEnabled: _darkTheme,
                    //     onStateChanged: (val) {
                    //       setState(() {
                    //         _darkTheme = val;
                    //       });
                    //       onThemeChanged(val, themeNotifier);
                    //     },
                    //   ),
                    // ),
                    CustomListTile(
                        title: "Chế độ tối",
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(
                            value: _darkTheme,
                            onChanged: (value) {
                              setState(() {
                                _darkTheme = value;
                              });
                            })
                    ),
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
                        title: "Thông tin ứng dụng", icon: Icons.info_outline_rounded),
                    CustomListTile(
                        title: "Đăng xuất", icon: Icons.exit_to_app_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

