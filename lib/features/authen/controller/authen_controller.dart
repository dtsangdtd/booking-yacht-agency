import 'package:booking_yatch_agency/core/models/authen_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/authen/authen_repo.dart';
import 'package:booking_yatch_agency/core/repositories/authen/authen_repo_impl.dart';
import 'package:booking_yatch_agency/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenController extends GetxController {
  late AuthenRepo _authenRepo;

  AuthenController() {
    _authenRepo = Get.find<AuthenRepoImpl>();
  }

  RxMap<String, dynamic> user = RxMap<String, dynamic>();
  RxBool isLoading = false.obs;
  RxBool isSignInLoading = false.obs;
  RxBool isOpenSignInLoading = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool isLogged = false.obs;
  RxString signInError = ''.obs;
  RxString signUpError = ''.obs;
  RxString openSignInError = ''.obs;

  @override
  onInit() async {
    checkLogin();
    ever(isLogged, fireRoute);
    super.onInit();
  }

  fireRoute(logged) async {
    if (logged) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('jwtToken') ?? '';
      user.value = JwtDecoder.decode(token);
      Get.offNamed('/home');
    } else {
      Get.offNamed('/login');
    }
  }

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwtToken');
    if (token != null) {
      isLogged.value = true;
    }
  }

  signIn(String username, String password) async {
    isSignInLoading.value = true;

    AuthenResponse response;
    response = await _authenRepo.signIn(username, password);

    if (response.error.isNotEmpty) {
      signInError.value = response.error;
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwtToken', response.data);
      isLogged.value = true;
    }

    isSignInLoading.value = false;
  }

  openSignIn(context) async {
    isOpenSignInLoading.value = true;

    await Authentication.signOut(context: context);
    User? user = await Authentication.signInWithGoogle(context: context);

    if (user == null) {
      openSignInError.value = 'Đã có lỗi xảy ra';
    } else {
      AuthenResponse response;
      String idToken = await user.getIdToken();
      response = await _authenRepo.openSignIn(idToken);

      if (response.error.isNotEmpty) {
        openSignInError.value = response.error;
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwtToken', response.data);

        isLogged.value = true;
      }
    }

    isOpenSignInLoading.value = false;
  }

  signUp(String name, String username, String password) async {
    isSignUpLoading.value = true;

    AuthenResponse response;
    response = await _authenRepo.signUp(name, username, password);

    if (response.error.isNotEmpty) {
      signUpError.value = response.error;
    } else {
      Get.offNamed('/login');
      Get.snackbar(
        'Thành công',
        'Đăng kí thành công! Đăng nhập để tiếp tục.',
      );
    }

    isSignUpLoading.value = false;
  }

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwtToken');
    isLogged.value = false;
    await Authentication.signOutNoContext();
  }
}
