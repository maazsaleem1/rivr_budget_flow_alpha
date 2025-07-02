import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'rivrBudgetFlow/view/rivr_splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(RivrBudgetFlow());
}

class RivrBudgetFlow extends StatelessWidget {
  const RivrBudgetFlow({super.key});
  // final imagePickController = Get.put(ImagePickController());
  //  final createAlbumController = Get.put(CreateAlbumController());
  //  final albumController = Get.put(AlbumController());
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 990),
      builder: (_, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: GetMaterialApp(
            //initialBinding: Binding(),
            theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1F2937), fontFamily: 'Inter'),
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            home: RivrSplashScreen(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

/// For Theming With Dark Mode
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rivr_budget_flow/controllers/theme_controller.dart';
// import 'package:rivr_budget_flow/export.dart';
// import 'package:rivr_budget_flow/view/auth_screens/splash.dart';
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.portraitUp,
//   ]);
//
//   HttpOverrides.global = MyHttpOverrides();
//
//   // Register controller once at app start
//   Get.put(ThemeController());
//
//   runApp(MemoryMag());
// }
//
// class MemoryMag extends StatelessWidget {
//   MemoryMag({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(390, 990),
//       builder: (_, child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//           child: GetBuilder<ThemeController>(
//             builder: (themeController) {
//               return GetMaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 useInheritedMediaQuery: true,
//                 theme: ThemeData(
//                   scaffoldBackgroundColor: AppColors.White,
//                   fontFamily: 'GeneralSans',
//                   brightness: Brightness.light,
//                 ),
//                 darkTheme: ThemeData(
//                   scaffoldBackgroundColor: Colors.black,
//                   fontFamily: 'GeneralSans',
//                   brightness: Brightness.dark,
//                 ),
//                 themeMode: themeController.theme,
//                 home: const SplashScreen(),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
