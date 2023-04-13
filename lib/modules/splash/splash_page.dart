import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(const Duration(seconds: 4, milliseconds: 30));
    Get.back();
    Get.offNamed(AppRoutes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/logo.png",
                  height: 50,
                  width: 50,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "Healthcare",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            _buildAnimations(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimations() {
    return Lottie.asset(
      'assets/animation/todo.json',
      height: 300,
      width: 300,
    );
  }
}
