import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/modules/home/home_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  var homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              SizedBox(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextFormField(
                    controller: homeController.searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tìm kiếm bệnh nhân",
                      // hintStyle: TextStyle(color: Colors.grey.shade400),
                      suffix: IconButton(
                        onPressed: () {
                          print(231);
                          homeController
                              .initList(homeController.searchController.text);
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
                height: 3,
              ),
            ]),
          ),
        ),
        body: Container(
          // color: Colors.grey.shade900,
          child: homeController.lstPatients.isNotEmpty
              ? ListView.builder(
                  controller: homeController.scrollController,
                  itemCount: homeController.lstPatients.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      child: userComponent(
                          user: homeController.lstPatients[index]),
                    );
                  })
              : const Center(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SizedBox(
          height: 110,
          width: 500,
          child: NeuBox(
            child: Row(
              children: [
                //Container for image icon

                // const Padding(
                //   padding: EdgeInsets.all(5),
                // child:
                ClipOval(
                  child: Image(
                    height: 90,
                    width: 90,
                    image: NetworkImage(user.avatar ??
                        "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                // ),
                const SizedBox(width: 10),
                //Podcast name and Podcast producer's name

                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        user.fullName ?? "", //podcast name
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                // Play Podcast icon
              ],
            ),
          ),
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: () {
    //     Get.toNamed(AppRoutes.INFOR_PAGE, arguments: user);
    //   },
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //         color: Colors.black,
    //       ),
    //       borderRadius: BorderRadius.circular(20.0),
    //     ),
    //     margin: const EdgeInsets.symmetric(horizontal: 20),
    //     padding: const EdgeInsets.only(top: 10, bottom: 10),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(children: [
    //           SizedBox(
    //               width: 60,
    //               height: 60,
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(50),
    //                 child: Image.network(
    //                     "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
    //               )),
    //           const SizedBox(width: 10),
    //           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //             Text(user?.fullName ?? "",
    //                 style: TextStyle(
    //                     color: Colors.grey.shade900,
    //                     fontWeight: FontWeight.w500)),
    //           ])
    //         ]),
    //       ],
    //     ),
    //   ),
    // );
  }
}

class NeuBox extends StatelessWidget {
  final Widget child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade400,
            offset: const Offset(5, 5),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.blue.shade100,
            offset: const Offset(-5, -5),
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}
