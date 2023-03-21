import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';

class ProfilePage extends StatefulWidget {
  final DataPatientResponse? user;

  const ProfilePage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DataPatientResponse? _user;

   @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  // void setUserData(DataPatientResponse user) {
  //   setState(() {
  //     user = user;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print("_xxxx__${ widget.user?.fullName}");
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(_user?.fullName ?? "",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                // Text(lName,
                //     style: const TextStyle(
                //         fontSize: 22, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 6),
              // Center(
              //   child: Text(
              //     email,
              //     style: TextStyle(color: Colors.grey.shade800),
              //   ),
              // ),
              const SizedBox(height: 15),
    
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 10),
              // Row(
              //   children: [
              //     const Text('_Username: ',
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //     Text(_userName.toString(),
              //         style: const TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.w400)),
              //   ],
              // ),
              // const SizedBox(height: 25),
              // Row(children: [
              //   const Text('Age: ',
              //       style:
              //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //   Text(dob.toString(),
              //       style: const TextStyle(
              //           fontSize: 18, fontWeight: FontWeight.w400))
              // ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Giới tính: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    _user?.gender != null
                        ? _user?.gender == 'MALE'
                            ? "Nam"
                            : "Nữ"
                        : "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Số điện thoại: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.phone.toString() ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Địa chỉ: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.address ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Công việc: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.job ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Số bảo hiểm: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.insuranceNumber ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Lịch sử bệnh: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.medicalHistory ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Trạng thái: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(_user?.state ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
