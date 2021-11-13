import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/constants/app_colors.dart';
import 'package:booking_yatch_agency/core/constants/app_fonts.dart';
import 'package:booking_yatch_agency/core/repositories/authen/authen_repo_impl.dart';
import 'package:booking_yatch_agency/core/repositories/order/order_repo_impl.dart';
import 'package:booking_yatch_agency/features/authen/binding/authen_binding.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
import 'package:booking_yatch_agency/features/authen/view/signin_view.dart';
import 'package:booking_yatch_agency/features/authen/view/signup_view.dart';
import 'package:booking_yatch_agency/features/confirm/binding/confirm_binding.dart';
import 'package:booking_yatch_agency/features/confirm/view/confirm_view.dart';
import 'package:booking_yatch_agency/features/detail/binding/detail_binding.dart';
import 'package:booking_yatch_agency/features/detail/view/detail_view.dart';
import 'package:booking_yatch_agency/features/home/binding/home_binding.dart';
import 'package:booking_yatch_agency/features/home/view/home_view.dart';
import 'package:booking_yatch_agency/features/payment/binding/payment_binding.dart';
import 'package:booking_yatch_agency/features/payment/view/payment_view.dart';
import 'package:booking_yatch_agency/features/select_ticket/binding/select_ticket_binding.dart';
import 'package:booking_yatch_agency/features/select_ticket/view/select_ticket_view.dart';
import 'package:booking_yatch_agency/features/select_time/binding/select_time_binding.dart';
import 'package:booking_yatch_agency/features/select_time/view/select_time_view.dart';
import 'package:booking_yatch_agency/features/sucess/binding/success_binding.dart';
import 'package:booking_yatch_agency/features/sucess/view/success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));

    Get.put(AuthenRepoImpl());
    Get.put(AuthenController());
    Get.put(OrderRepoImpl());
    Get.put(GlobalController());

    initializeDateFormatting();
    Intl.defaultLocale = 'vi';

    return ScreenUtilInit(
      designSize: const Size(630, 720),
      builder: () => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking Yatch Agency',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: AppColors.primaryColor,
            ),
            fontFamily: fontFamily,
            primaryColor: AppColors.primaryColor,
          ),
          getPages: [
            GetPage(
              name: '/login',
              page: () => SignIn(),
              binding: AuthenBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/register',
              page: () => SignUp(),
              binding: AuthenBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/home',
              page: () => Home(),
              binding: HomeBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/detail',
              page: () => Detail(),
              binding: DetailBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/select-time',
              page: () => SelectTime(),
              binding: SelectTimeBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/select-ticket',
              page: () => SelectTicket(),
              binding: SelectTicketBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/confirm',
              page: () => Confirm(),
              binding: ConfirmBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/success',
              page: () => Success(),
              binding: SuccessBinding(),
              transition: Transition.noTransition,
            ),
            GetPage(
              name: '/payment',
              page: () => Payment(),
              binding: PaymentBinding(),
              transition: Transition.noTransition,
            ),
          ],
          initialRoute: '/login',
        ),
      ),
    );
  }
}
