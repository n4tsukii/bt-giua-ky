import "package:setting_tab/models/diem.dart";
import "package:setting_tab/widgets/components/theme.dart";
import "/widgets/homepage.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import '../models/sinhvien.dart';
import '../models/monhoc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StudentProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => MonHocState()),
        ChangeNotifierProvider(create: (context) => DiemProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeProvider>(context).isDarkModeEnabled
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
