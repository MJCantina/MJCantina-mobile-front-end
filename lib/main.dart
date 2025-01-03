import 'package:cantina_senai/core/configs/core_config/config.dart';
import 'package:cantina_senai/core/configs/theme/app_colors.dart';
import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/data/models/services/favorite_controller.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfigurations();
  await initAuthService();
  
 
  
  

  SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
  statusBarColor: AppColors.primary,
  statusBarIconBrightness: Brightness.light,
));


  runApp(const MyApp());
  Get.put(FavoritesController());
}

Future<void> initAuthService() async {
  Get.put(AuthService());
  

  await Future.delayed(Duration.zero); // Ou qualquer outra lógica de espera que você precisa
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light)
        ),
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const SplashPage(),  // A tela inicial é a SplashPage
    );
  }
}
