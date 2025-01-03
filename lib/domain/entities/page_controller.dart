import 'package:cantina_senai/data/models/services/auth_services.dart';
import 'package:cantina_senai/presentation/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Checkauth extends StatelessWidget {
  const Checkauth({super.key});

  Future<bool> checkToken() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'firebase_token');
    return token!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.data == true) {
          AuthService.to.userIsAuthenticated.value = true;
          return const SplashPage();
        } else {
          AuthService.to.userIsAuthenticated.value = false;
          return const SplashPage();
        }
      },
    );
  }
}
