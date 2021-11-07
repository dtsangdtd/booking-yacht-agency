import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_constants.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/widgets/primary_button.dart';
import 'package:booking_yatch_agency/widgets/primary_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final controller = Get.find<AuthenController>();
  final name = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();
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
                Text('Đăng kí', style: AppFonts.h2b),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 0.8.sw,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        InputForm(
                          'Họ và tên',
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.space +
                                  'Họ và tên không được để trống';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.signUpError.value = '';
                          },
                          prefixIcon: const Icon(Icons.badge_outlined),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputForm(
                          'Email',
                          controller: username,
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
                          onChanged: (value) {
                            controller.signUpError.value = '';
                          },
                          prefixIcon: const Icon(Icons.email_outlined),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputForm(
                          'Mật khẩu',
                          controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.space +
                                  'Mật khẩu không được để trống';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.signUpError.value = '';
                          },
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InputForm(
                          'Nhập lại mật khẩu',
                          controller: rePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.space +
                                  'Mật khẩu không được để trống';
                            }
                            if (value != password.text) {
                              return 'Mật khẩu không khớp';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.signUpError.value = '';
                          },
                          obscureText: true,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Obx(
                          () => controller.signUpError.value.isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  child: Text(
                                    controller.signUpError.value,
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
                              'Đăng kí',
                              () {
                                if (_formKey.currentState!.validate()) {
                                  controller.signUp(
                                      name.text, username.text, password.text);
                                }
                              },
                              isLoading: controller.isSignUpLoading.value,
                            ),
                          ),
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
                    Text('Đã có tài khoản? ', style: AppFonts.h4),
                    InkWell(
                      onTap: () {
                        controller.signUpError.value = '';
                        Get.offNamed('/login');
                      },
                      child: Text('Đăng nhập', style: AppFonts.h4b),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
