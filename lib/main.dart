import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app_doctor/routes/app_pages.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => LocalStorageService.init());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
          designSize: const Size(1440, 3040),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) => GetMaterialApp(
            fallbackLocale: const Locale('en',
                'US'), // specify the fallback locale in case an invalid locale is selected.

            debugShowCheckedModeBanner: false,
            getPages: AppPages.getPages,

            // set font for all project
            theme: ThemeData(
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            initialRoute: AppRoutes.SPLASH_SCREEN,
            builder: (ctx, child) {
              child = EasyLoading.init()(ctx, child);
              // ScreenUtil.setContext(ctx);

              return child;
            },
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate
            ],
          ),
        );
  }
}
