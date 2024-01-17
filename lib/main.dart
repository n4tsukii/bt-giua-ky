import "package:setting_tab/widgets/components/theme.dart";
import 'package:setting_tab/widgets/settings.dart';
import "/widgets/homepage.dart";
import "/models/user_interface.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../models/sinhvien.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInterface()),
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: MaterialApp(
            home: MyHomePage(),
      ),
    );
  }
}