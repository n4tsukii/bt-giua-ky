import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySettings extends StatefulWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  State<MySettings> createState() => _MySettings();
}

class _MySettings extends State<MySettings> {
  bool _isDark =false;
  @override
  Widget build(BuildContext context){
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 15),
                      child: Text(
                        'Cai dat',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: ListView(
                children: [
                  _SingleSection(
                      title: 'General',
                      children: [
                        _CustomListTile(
                            title: 'Dark Mode',
                            icon: Icons.dark_mode_outlined,
                          trailing: Switch(
                            value: _isDark,
                            onChanged: (value) {
                              setState(() {
                                _isDark = value;
                              });
                            },
                          ),
                        ),
                        const _CustomListTile(
                            title: "Notifications",
                            icon: Icons.notifications_none_rounded
                        ),
                        const _CustomListTile(
                            title: "Security Status",
                            icon: CupertinoIcons.lock_shield
                        ),
                      ],
                  ),
                  const Divider(),
                  const _SingleSection(
                    children: [
                      _CustomListTile(
                          title: "Help & Feedback",
                          icon: Icons.help_outline_rounded),
                      _CustomListTile(
                          title: "About", icon: Icons.info_outline_rounded),
                      _CustomListTile(
                          title: "Sign out", icon: Icons.exit_to_app_rounded),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
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

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
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

// import "package:flutter/material.dart";
// import 'package:flutter/cupertino.dart';
//
// class MySettings extends StatefulWidget{
//   const MySettings({Key? key}) : super(key: key);
//   @override
//   State<MySettings> createState() => _MySettings();
// }
//
// class _Mysetting extends State<MySettings>{
//   bool _isDark =false;
//   @override
//   Widget build(BuildContext context){
//     return Theme(
//       data: _isDark ? ThemeData.dark() : ThemeData.light(),
//       child: Scaffold(
//         body: ListView(
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
//               decoration: const BoxDecoration(
//                   color: Colors.blueAccent,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   )
//               ),
//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 20),
//                   Padding(
//                       padding: EdgeInsets.only(left: 3, bottom: 15),
//                       child: Text(
//                         'Cai dat',
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 1,
//                           wordSpacing: 2,
//                           color: Colors.white,
//                         ),
//                       ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               constraints: const BoxConstraints(maxWidth: 400),
//               child: ListView(
//                 children: [
//                   _SingleSection(
//                       title: 'General',
//                       children: [
//                         _CustomListTile(
//                             title: 'Dark Mode',
//                             icon: Icons.dark_mode_outlined,
//                           trailing: Switch(
//                             value: _isDark,
//                             onChanged: (value) {
//                               setState(() {
//                                 _isDark = value;
//                               });
//                             },
//                           ),
//                         ),
//                         const _CustomListTile(
//                             title: "Notifications",
//                             icon: Icons.notifications_none_rounded
//                         ),
//                         const _CustomListTile(
//                             title: "Security Status",
//                             icon: CupertinoIcons.lock_shield
//                         ),
//                       ],
//                   ),
//                   const Divider(),
//                   const _SingleSection(
//                     children: [
//                       _CustomListTile(
//                           title: "Help & Feedback",
//                           icon: Icons.help_outline_rounded),
//                       _CustomListTile(
//                           title: "About", icon: Icons.info_outline_rounded),
//                       _CustomListTile(
//                           title: "Sign out", icon: Icons.exit_to_app_rounded),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _CustomListTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Widget? trailing;
//   const _CustomListTile(
//       {Key? key, required this.title, required this.icon, this.trailing})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       leading: Icon(icon),
//       trailing: trailing,
//       onTap: () {},
//     );
//
//   }
// }
// class _SingleSection extends StatelessWidget {
//   final String? title;
//   final List<Widget> children;
//   const _SingleSection({
//     Key? key,
//     this.title,
//     required this.children,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (title != null)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title!,
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//         Column(
//           children: children,
//         ),
//       ],
//     );
//   }
// }
