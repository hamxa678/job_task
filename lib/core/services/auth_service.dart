import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../locator.dart';
import '../../ui/custom_widgets/dialogs/auth_dialog.dart';
import '../models/body/login_body.dart';
import '../models/body/reset_password_body.dart';
import '../models/body/signup_body.dart';
import '../models/other_models/user_profile.dart';
import '../models/responses/auth_response.dart';
import '../models/responses/user_profile_response.dart';
import '../others/logger_customizations/custom_logger.dart';
import 'database_service.dart';
import 'device_info_service.dart';
import 'local_storage_service.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///

class AuthService {
  late bool isLogin;
  final _localStorageService = locator<LocalStorageService>();
  final _dbService = locator<DatabaseService>();
  UserProfile? userProfile;
  String? fcmToken;
  static final Logger log = CustomLogger(className: 'AuthService');

  ///
  /// [doSetup] Function does the following things:
  ///   1) Checks if the user is logged then:
  ///       a) Get the user profile data
  ///       b) Updates the user FCM Token
  ///
  doSetup() async {
    isLogin = _localStorageService.accessToken != null;
    if (isLogin) {
      log.d('User is already logged-in');
      await _getUserProfile();
      await _updateFcmToken();
    } else {
      log.d('@doSetup: User is not logged-in');
    }
  }

  _getUserProfile() async {
    UserProfileResponse response = await _dbService.getUserProfile();
    if (response.success) {
      userProfile = response.profile;
      log.d('Got User Data: ${userProfile?.toJson()}');
    } else {
      Get.dialog(AuthDialog(title: 'Title', message: response.error!));
    }
  }

  ///
  /// Updating FCM Token here...
  ///
  _updateFcmToken() async {
    // final fcmToken = await locator<NotificationsService>().getFcmToken();
    final deviceId = await DeviceInfoService().getDeviceId();
    final response = await _dbService.updateFcmToken(deviceId, fcmToken!);
    if (response.success) {
      userProfile!.fcmToken = fcmToken;
    }
  }

  signupWithEmailAndPassword(SignUpBody body) async {
    late AuthResponse response;
    response = await _dbService.createAccount(body);
    if (response.success) {
      userProfile = UserProfile.fromJson(body.toJson());
      _localStorageService.accessToken = response.accessToken;
      await _updateFcmToken();
    }
    return response;
  }

  loginWithEmailAndPassword(LoginBody body) async {
    late AuthResponse response;
    response = await _dbService.loginWithEmailAndPassword(body);
    if (response.success) {
      _localStorageService.accessToken = response.accessToken;
      await _getUserProfile();
      await _updateFcmToken();
    }
    return response;
  }

  resetPassword(ResetPasswordBody body) async {
    final AuthResponse response = await _dbService.resetPassword(body);
    if (response.success) {
      _localStorageService.accessToken = response.accessToken;
    }
    return response;
  }

  signupWithApple() {}

  signupWithGmail() {}

  signupWithFacebook() {}

  logout() async {
    isLogin = false;
    userProfile = null;
    await _dbService.clearFcmToken(await DeviceInfoService().getDeviceId());
    _localStorageService.accessToken = null;
  }
}
