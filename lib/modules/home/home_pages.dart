import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/modules/home/home_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  var homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  hintStyle:
                      TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  hintText: "Search users"),
            ),
          ),
        ),
        body: Container(
          // color: Colors.grey.shade900,
          child: homeController.lstPatients.isNotEmpty
              ? ListView.builder(
                  itemCount: homeController.lstPatients.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      // actionPane: SlidableDrawerActionPane(),
                      // actionExtentRatio: 0.25,
                      child: userComponent(
                          user: homeController.lstPatients[index]),
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
    });
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
          ],
        ),
      ),
    );
  }
}
