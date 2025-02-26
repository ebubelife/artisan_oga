import 'package:artisan_oga/presentation/employer_sign_uppage_screen/employer_sign_uppage_screen.dart';
import 'package:artisan_oga/presentation/j_s_create_account_page_two_screen/j_s_create_account_page_two_screen.dart';
import 'package:flutter/material.dart';
import 'package:artisan_oga/core/app_export.dart';
import 'package:artisan_oga/widgets/custom_elevated_button.dart';
import 'package:page_transition/page_transition.dart';

import '../j_s_create_account_page_screen/j_s_create_account_page_screen.dart';
import '../j_s_create_account_page_three_screen/j_s_create_account_page_three_screen.dart';

class SignupOptionsPageScreen extends StatelessWidget {
  const SignupOptionsPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgEmployerRegister,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 25.h,
              vertical: 12.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 32.v),
                CustomImageView(
                  imagePath: ImageConstant.imgCba516f14b444,
                  height: 79.v,
                  width: 242.h,
                ),
                Spacer(),
                CustomElevatedButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: EmployerSignUpPageScreen()));
                  }),
                  height: 51.v,
                  text: "Register as an Employer",
                  buttonStyle: CustomButtonStyles.outlineGray,
                  buttonTextStyle:
                      CustomTextStyles.titleLargeOnPrimaryContainer,
                ),
                SizedBox(height: 16.v),
                CustomElevatedButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Durations.long1,
                            child: JSCreateAccountPageThreeScreen()));
                  }),
                  height: 51.v,
                  text: "Register as a job seeker",
                  buttonStyle: CustomButtonStyles.outlineGray,
                  buttonTextStyle: CustomTextStyles.titleLargeGray50,
                ),
                SizedBox(height: 63.v),
                SizedBox(
                  width: 130.h,
                  child: Divider(
                    color: appTheme.gray50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
