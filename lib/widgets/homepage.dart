import '/widgets/components/my_drawer.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

List catNames = ["Sinh viên", 'Cài đặt'];
List<Color> catColors = [
  Color(0xFFFFCF2F),
  Color(0xFF6Fe08D),

];

List<Icon> catIcons = [
  Icon(Icons.manage_accounts_outlined, color: Colors.white, size: 30),

  Icon(Icons.settings_outlined, color: Colors.white, size: 30),
];
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                      'Quản lý sinh viên',
                    style: TextStyle(
                      fontSize: 25,
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
          Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: catNames.length,
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                      ),
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: catIcons[index],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserInterface>(
//       builder: (context, ui, child) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Quản lý sinh viên"),
//             backgroundColor: ui.appBarColor,
//           ),
//
//           drawer: MyDrawer(),
//
//           body: Center(
//             child: Text(
//               "Trang chủ",
//               style: TextStyle(
//                 fontSize: ui.fontSize,
//               )
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
