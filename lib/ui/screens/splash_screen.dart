import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../core/models/other_models/onboarding.dart';
import '../../core/others/logger_customizations/custom_logger.dart';
import '../../core/services/auth_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../locator.dart';
import '../custom_widgets/dialogs/network_error_dialog.dart';
import 'root/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();
  // final _notificationService = locator<NotificationsService>();
  List<Onboarding> onboardingList = [];
  final Logger log = CustomLogger(className: 'Splash Screen');


  @override
  void didChangeDependencies() {
    _initialSetup();
    super.didChangeDependencies();
  }

  _initialSetup() async {
    await _localStorageService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(const NetworkErrorDialog());
      return;
    }

    ///
    ///initializing notification services
    ///

    await _authService.doSetup();

    ///
    ///checking if the user is login or not
    ///
    log.d('@_initialSetup. Login State: ${_authService.isLogin}');
    if (_authService.isLogin) {
      Get.off(() => const RootScreen());
    } else {
      Get.off(() => RootScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return const Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
