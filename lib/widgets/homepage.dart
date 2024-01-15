import 'package:setting_tab/widgets/ql_sinhvien.dart';
import 'package:setting_tab/widgets/settings.dart';
import '/widgets/components/my_drawer.dart';
import '/models/user_interface.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
List imgList = ['Sinh viên', 'Môn học', 'Cài đặt'];

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
            child: const Column(
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
                    itemCount: imgList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (MediaQuery.of(context).size.height - 50 - 25) / (4 * 240),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          handleNavigation(context, index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assests/icons/${imgList[index]}.png",
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                  imgList[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    // itemCount: catNames.length,
                    // shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3,
                    //     childAspectRatio: 1.1,
                    //   ),
                    // itemBuilder: (context, index){
                    //   return Column(
                    //     children: [
                    //       Container(
                    //         height: 60,
                    //         width: 60,
                    //         decoration: BoxDecoration(
                    //           color: catColors[index],
                    //           shape: BoxShape.circle,
                    //         ),
                    //         child: Center(
                    //           child: catIcons[index],
                    //         ),
                    //       ),
                    //       SizedBox(height: 10),
                    //       Text(
                    //         catNames[index],
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.black.withOpacity(0.7),
                    //         ),
                    //       ),
                    //     ],
                    //   );
                    // },
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
void handleNavigation(BuildContext context, int index) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ql_sinhvien()),
    );
  } else if (index == 1) {
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MySettings()),
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
