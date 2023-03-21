import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/modules/home/home_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // setState(() {
    //   _foundedUsers = _users;
    // });
  }

  // onSearch(String search) {
  //   setState(() {
  //     _foundedUsers = _users.where((user) => user.name.toLowerCase().contains(search)).toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 38,
          child: TextField(
            // onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
                filled: true,
                // fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                hintText: "Search users"),
          ),
        ),
      ),
      body: Container(
        // color: Colors.grey.shade900,
        child: homeController.lstPatients.length > 0
            ? ListView.builder(
                itemCount: homeController.lstPatients.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    // actionPane: SlidableDrawerActionPane(),
                    // actionExtentRatio: 0.25,
                    child:
                        userComponent(user: homeController.lstPatients[index]),
                    // actions: <Widget>[
                    //   new IconSlideAction(
                    //     caption: 'Archive',
                    //     color: Colors.transparent,
                    //     icon: Icons.archive,
                    //     onTap: () => print("archive"),
                    //   ),
                    //   new IconSlideAction(
                    //     caption: 'Share',
                    //     color: Colors.transparent,
                    //     icon: Icons.share,
                    //     onTap: () => print('Share'),
                    //   ),
                    // ],
                    // secondaryActions: <Widget>[
                    //   new IconSlideAction(
                    //     caption: 'More',
                    //     color: Colors.transparent,
                    //     icon: Icons.more_horiz,
                    //     onTap: () => print('More'),
                    //   ),
                    //   new IconSlideAction(
                    //     caption: 'Delete',
                    //     color: Colors.transparent,
                    //     icon: Icons.delete,
                    //     onTap: () => print('Delete'),
                    //   ),
                    // ],
                  );
                })
            : Center(
                child: Text(
                "No users found",
                style: TextStyle(color: Colors.white),
              )),
      ),
    );
  }

  userComponent({required DataPatientResponse user}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.INFOR_PAGE, arguments: user);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                        "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
                  )),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(user?.fullName ?? "",
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                // Text(user.username, style: TextStyle(color: Colors.grey[500])),
              ])
            ]),
            // GestureDetector(
            // onTap: () {
            //   setState(() {
            //     // user.isFollowedByMe = !user.isFollowedByMe;
            //   });
            // },
            // child: AnimatedContainer(
            //     height: 35,
            //     width: 110,
            //     duration: Duration(milliseconds: 300),
            //     decoration: BoxDecoration(
            //         color: user.isFollowedByMe
            //             ? Colors.blue[700]
            //             : Color(0xffffff),
            //         borderRadius: BorderRadius.circular(5),
            //         border: Border.all(
            //           color: user.isFollowedByMe
            //               ? Colors.transparent
            //               : Colors.grey.shade700,
            //         )),
            //     child: Center(
            //         child: Text(user.isFollowedByMe ? 'Unfollow' : 'Follow',
            //             style: TextStyle(
            //                 color: user.isFollowedByMe
            //                     ? Colors.white
            //                     : Colors.white)))),
            // )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nb_utils/nb_utils.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) => TabBarWidget(
//         title: 'Sức khỏe',
//         tabs: const [
//           Tab(icon: Icon(Icons.table_chart), text: 'Bảng'),
//           Tab(icon: Icon(Icons.bar_chart), text: 'Biểu đồ'),
//         ],
//         children: [
//           HomeTable(),
//           SafeArea(
//             child: ListView(padding: const EdgeInsets.all(16), children: [
//               const SizedBox(
//                 height: 16.0,
//               ),
//               _buildFieldSelect(
//                 'BMI',
//                 Colors.grey[400]!,
//                 () {
//                   Get.toNamed(AppRoutes.BMI_PAGE);
//                 },
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               _buildFieldSelect(
//                 'Huyết áp',
//                 Colors.yellow[200]!,
//                 () {
//                   Get.toNamed(AppRoutes.BLOOD_PRESSURE_PAGE);
//                 },
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               _buildFieldSelect(
//                 'Nhịp tim',
//                 Colors.green[100]!,
//                 () {
//                   Get.toNamed(AppRoutes.HEARTBEAT_PAGE);
//                 },
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               _buildFieldSelect(
//                 'Glucose',
//                 Colors.blue[100]!,
//                 () {
//                   Get.toNamed(AppRoutes.GLUCOSE_PAGE);
//                 },
//               ),
//               const SizedBox(
//                 height: 16.0,
//               ),
//               _buildFieldSelect(
//                 'Cholesterol',
//                 Colors.orange[200]!,
//                 () {
//                   Get.toNamed(AppRoutes.CHOLESTEROL_PAGE);
//                 },
//               )
//             ]),
//           ),
//         ],
//       );

//   _buildFieldSelect(text, color, VoidCallback press) {
//     return InkWell(
//       onTap: press,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         height: 90,
//         decoration: BoxDecoration(
//           border: Border.all(
//             width: 1.2,
//           ),
//           color: color,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(16.0),
//           ),
//         ),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   text,
//                   style: GoogleFonts.montserrat(
//                     color: black,
//                     fontSize: 18,
//                     letterSpacing: 1,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               ],
//             ),
//             const Spacer(),
//             const Icon(
//               CupertinoIcons.chevron_forward,
//               color: black,
//               size: 24,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
