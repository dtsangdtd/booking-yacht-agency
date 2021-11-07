import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/utils/authentication.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:booking_yatch_agency/widgets/primary_input_form.dart';
import 'package:booking_yatch_agency/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final controller = Get.find<AuthenController>();
  final username = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: 1.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 0.8.sw,
                  child: Image.asset('lib/core/assets/images/logo.png'),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text('Đăng nhập', style: AppFonts.h2b),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 0.8.sw,
                    child: Column(
                      children: [
                        InputForm(
                          'Email',
                          prefixIcon: const Icon(Icons.email_outlined),
                          controller: username,
                          onChanged: (value) {
                            controller.signInError.value = '';
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.space +
                                  'Email không được để trống';
                            }
                            if (!GetUtils.isEmail(username.text)) {
                              return AppConstants.space + 'Email không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputForm(
                          'Mật khẩu',
                          prefixIcon: const Icon(Icons.lock_outline),
                          controller: password,
                          obscureText: true,
                          onChanged: (value) {
                            controller.signInError.value = '';
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.space +
                                  'Mật khẩu không được để trống';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Obx(
                          () => controller.signInError.value.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  child: Text(
                                    controller.signInError.value,
                                    style: AppFonts.h4
                                        .copyWith(color: AppColors.error),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(
                          height: 45.h,
                          child: Obx(
                            () => PrimaryButton(
                              'Đăng nhập',
                              () {
                                if (_formKey.currentState!.validate()) {
                                  controller.signIn(
                                      username.text, password.text);
                                }
                              },
                              isLoading: controller.isSignInLoading.value,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            const Expanded(child: Divider()),
                            SizedBox(width: 10.w),
                            Text(
                              'Hoặc',
                              style:
                                  AppFonts.h4.copyWith(color: AppColors.gray),
                            ),
                            SizedBox(width: 10.w),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Obx(
                          () => controller.openSignInError.value.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  child: Text(
                                    controller.openSignInError.value,
                                    style: AppFonts.h4
                                        .copyWith(color: AppColors.error),
                                  ),
                                )
                              : const SizedBox(),
                        ),
                        FutureBuilder(
                          future: Authentication.initializeFirebase(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Error initializing Firebase');
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return SizedBox(
                                height: 45.h,
                                child: Obx(
                                  () => SecondaryButton(
                                    'Đăng nhập với Google',
                                    () {
                                      controller.openSignIn(context);
                                    },
                                    isLoading:
                                        controller.isOpenSignInLoading.value,
                                    prefix: SizedBox(
                                      width: 60.w,
                                      child: Image.asset(
                                          'lib/core/assets/images/google.png'),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.orange),
                            );
                          },
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Chưa có tài khoản? ', style: AppFonts.h4),
                    InkWell(
                      onTap: () {
                        controller.signInError.value = '';
                        Get.offNamed('/register');
                      },
                      child: Text('Đăng kí', style: AppFonts.h4b),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
